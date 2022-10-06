#!/bin/bash
# Query database of Elements
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

MAIN() {
	if [[ -z $1 ]]
	then
		echo "Please provide an element as an argument."
		exit
	else
		QUERY=$1
		#echo $QUERY
		re='^[0-9]+$'
		# check if element requested is numeric
		if [[ $QUERY =~ $re ]]
		then
			ATOMIC_NUMBER_FROM_ELEMENT_TABLE=$($PSQL "SELECT atomic_number from elements WHERE atomic_number = $QUERY")
		else
			ATOMIC_NUMBER_FROM_ELEMENT_TABLE=$($PSQL "SELECT atomic_number FROM elements WHERE name='$QUERY' OR symbol='$QUERY';" )
		fi

		if [[ -z $ATOMIC_NUMBER_FROM_ELEMENT_TABLE ]]
		then
			# else - say that you could not find the element and bail out
			echo "I could not find that element in the database."
			exit
		fi

		# echo $ATOMIC_NUMBER_FROM_ELEMENT_TABLE Getting information for this element from the DB
		GET_INFO_FOR_ATOMIC_NUMBER=$($PSQL "SELECT * FROM elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$ATOMIC_NUMBER_FROM_ELEMENT_TABLE")
		if [[ -z $GET_INFO_FOR_ATOMIC_NUMBER ]]
		then
			echo "Information for atomic number $ATOMIC_NUMBER_FROM_ELEMENT_TABLE was not found in the properties table."
			exit
		else
			echo $GET_INFO_FOR_ATOMIC_NUMBER | while read TYPE_ID BAR ATOMIC_NUMBER BAR ELEMENT_SYMBOL BAR ELEMENT_NAME BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR ATOMIC_MASS BAR ELEMENT_TYPE
			do
				echo The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME \($ELEMENT_SYMBOL\). It\'s a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius.
			done
		fi
	fi
}

MAIN $1