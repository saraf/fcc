#!/bin/bash
# A number guessing game

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

PRINT_USER_WELCOME() {
  name="$1" ; user_id=$2;
  local games_played=$($PSQL "select count(*)  from games where user_id = '$user_id'")
  local best_guesses=$($PSQL "select min(number_of_guesses) from games where user_id = '$user_id'")
  if [[ -z $best_guesses ]]
  then
    best_guesses=0
  fi

  echo Welcome back, $name! You have played $games_played games, and your best game took $best_guesses guesses.
  return 0
}

PLAY_GAME() {
  local name="$1"; 
  local user_id=$2;
  local number_of_guesses=0;
  local guess_count=0;
  # generate a random number between 1 and 1000
  RANDOM_NUMBER=$(($RANDOM % 1000))
 #echo $RANDOM_NUMBER
  dofirst=true
  
  local do_first=true
  while [[ $GUESS != $RANDOM_NUMBER ]]
  do
  #echo Guess is $GUESS but looking for $RANDOM_NUMBER
  #while guessed number is not equals to our random number
  #read input
  if [[ $do_first == true ]]
  then
    echo "Guess the secret number between 1 and 1000:"
    do_first=false
  fi
  
  read GUESS
  
  #increment guess count
  ((guess_count++))
  #if input is not numeric - print appropriate err msg and go back to the beginning of the loop
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue;
  fi
  #if input is numeric and less than our number 
  #print a message saying number was low and go back to loop start
  if [[ $GUESS -lt $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    continue;
  fi

  #if input is numeric and greater than our number - print a message and go back to loop start
  if [[ $GUESS -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    continue;
  fi

  if [[ $GUESS -eq $RANDOM_NUMBER ]]
  then
    break;
  fi
  
  done
  # add the result to the games table
  INSERT_GAME_RESULT=$($PSQL "insert into games(number_of_guesses, user_id) values($guess_count, $user_id)")
  echo You guessed it in $guess_count tries. The secret number was $RANDOM_NUMBER. Nice job!

}



echo -e "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ADD_NEW_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
else
  PRINT_USER_WELCOME "$USERNAME" $USER_ID
fi

PLAY_GAME "$USERNAME" $USER_ID