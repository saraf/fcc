#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
	if [[ $1 ]]
	then
		echo -e "\n$1"
	fi
	echo -e "Welcome to My Salon, how can I help you?"

	# get list of services
	SERVICE_LIST=$($PSQL "SELECT service_id, name from services ORDER BY service_id")
	echo "$SERVICE_LIST" | while read SERVICE_ID BAR SERVICE_NAME
	do
		echo "$SERVICE_ID) $SERVICE_NAME"
	done
	
	# read service number desired
	read SERVICE_ID_SELECTED
	# if service number is not valid
	SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
	if [[ -z $SERVICE_NAME ]]
	then
		# show the main menu again
		MAIN_MENU "That was an invalid service ID"
	else
		#ask for customer phone number
		echo -e "\nPlease enter your phone number:"
		read CUSTOMER_PHONE
		CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE' ")
		#if not found - register customer (ask for name)
		if [[ -z $CUSTOMER_NAME ]]
		then
			#ask for name
			echo -e "\nWhat's your name?"
			read CUSTOMER_NAME
			#enter name and customer phone number in customer table
			INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
		fi
		# get customer ID
		CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

		#ask for time when they want the service
		echo -e "\nWhat time do you want the service?"
		read SERVICE_TIME
		#create an entry in the appointments table giving - customer_id, service_id, time
		APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
		echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
	fi
	

}


MAIN_MENU
