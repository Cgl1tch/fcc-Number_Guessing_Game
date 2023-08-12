#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(shuf -i 1-1000 -n 1)
GUESSES=0

GUESS_GAME() {
  ((GUESSES++))
  read USER_GUESS
  if [[ ! $USER_GUESS =~  ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GUESS_GAME
  else
    if [[ $USER_GUESS = $RANDOM_NUMBER ]]
    then
    
      echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, no_of_guesses) VALUES($USER_ID, $GUESSES)")
      UPDATE_USER_TABLE=$($PSQL "UPDATE users SET games_played=(SELECT COUNT(*) FROM games WHERE games.user_id=users.user_id)")
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=(SELECT MIN(no_of_guesses) FROM games WHERE user_id=$USER_ID) WHERE user_id=$USER_ID")
    else
      if [[ $USER_GUESS -gt 1000 ]]
      then
        echo "Please choose a number between 1 and 1000"
        
        GUESS_GAME
      else
        if [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
          GUESS_GAME
        else
          echo "It's lower than that, guess again:"
          GUESS_GAME
        fi
      fi
    fi
  fi
}


echo -e "\nEnter your username:"
read USERNAME

UNAME_SEARCH=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
UNAME_FORMATTED=$(echo "$UNAME_SEARCH" | sed 's/|/ /g')

if [[ -z $UNAME_SEARCH ]]
then
  $($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  
  echo "$UNAME_FORMATTED" | while read USER_ID USER BEST_GAME GAMES_PLAYED
  do
    echo "Welcome back, $USER! You have played  $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi
echo -e "\nGuess the secret number between 1 and 1000: "

GUESS_GAME

