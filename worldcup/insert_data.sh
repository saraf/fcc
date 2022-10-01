#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != 'year' ]]
then
  #get the winner team id
  TEAM_ID=$($PSQL "SELECT team_id from teams WHERE name='$WINNER'")
  #if not found
  if [[ -z $TEAM_ID ]]
  then
    TEAM_ID=NULL  
  
    #insert team
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
    if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $WINNER
    fi
    TEAM_ID=$($PSQL "SELECT team_id from teams WHERE name='$WINNER'")
  fi
  #get the opponent team id
  OPPONENT_ID=$($PSQL "SELECT team_id from teams WHERE name='$OPPONENT'")
  #if not found
  if [[ -z $OPPONENT_ID ]]
  then
    OPPONENT_ID=NULL  
    #insert team
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
    if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $OPPONENT
    fi
    OPPONENT_ID=$($PSQL "SELECT team_id from teams WHERE name='$OPPONENT'")
  fi

  echo $WINNER $TEAM_ID $OPPONENT $OPPONENT_ID
  INSERT_MATCH_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR,'$ROUND',$TEAM_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  if [[ $INSERT_MATCH_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted match between $WINNER and $OPPONENT. $WINNER won by $WINNER_GOALS - $OPPONENT_GOALS
  fi
fi
done

# populate the games table
#cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT