#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"

#Save data
SAVE_USER(){
  SAVE_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$1')")
}



#Get data
GET_USERNAME_ID_BY_USERNAME(){
  USERNAME_ID=$($PSQL "SELECT user_id FROM users WHERE username='$1'")
  echo $USERNAME_ID
}

GENERATE_RANDOM_NUMBER(){
  RANDOM_NUMBER=$((1 + RANDOM % 1000))
  echo $RANDOM_NUMBER
}

GET_TOTAL_GAMES(){
  USERNAME_ID=$1
  TOTAL_GAMES=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USERNAME_ID")
  echo $TOTAL_GAMES
}

GET_BEST_SCORE(){
  USERNAME_ID=$1
  BEST_SCORE=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USERNAME_ID")
  echo $BEST_SCORE
}


# Other

GREETING(){
  echo "Enter your username:"
  read USERNAME

  USERNAME_ID=$(GET_USERNAME_ID_BY_USERNAME $USERNAME)
  if [[ -z $USERNAME_ID ]]
    then
      SAVE_USER $USERNAME
      echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    else
      TOTAL_USER_GAMES=$(GET_TOTAL_GAMES $USERNAME_ID)
      if [[ $TOTAL_USER_GAMES == 0 ]]
        then
          echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
        else
          BEST_SCORE=$(GET_BEST_SCORE $USERNAME_ID)
          echo -e "\nWelcome back, $USERNAME! You have played $TOTAL_USER_GAMES games, and your best game took $BEST_SCORE guesses."
      fi
  fi
}
GUESS_GAME(){
  USERNAME_ID=$(GET_USERNAME_ID_BY_USERNAME $USERNAME)
  RANDOM_NUMBER=$(GENERATE_RANDOM_NUMBER)
  echo -e "\nGuess the secret number between 1 and 1000:"
  read GUESSED_NUMBER
  COUNT=0
  # if not a number
  while [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  do
      echo -e "\nThat is not an integer, guess again:"
      read GUESSED_NUMBER
  done
  
  COUNT=$((COUNT+1))
  while [[ $GUESSED_NUMBER != $RANDOM_NUMBER ]]
  do
    while [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
    do
        echo -e "\nThat is not an integer, guess again:"
        read GUESSED_NUMBER
    done

    if [[ $GUESSED_NUMBER < $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
        read GUESSED_NUMBER
      else
        echo "It's lower than that, guess again:"
        read GUESSED_NUMBER
    fi
    COUNT=$((COUNT+1))

  done
  SAVE_GAME_STATUS=$($PSQL "INSERT INTO games(guesses, user_id) VALUES($COUNT, $USERNAME_ID)")
  echo -e "\nYou guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"

}

GREETING
GUESS_GAME