#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

ELEMENT_NOT_FOUND(){
  echo -e "I could not find that element in the database."
  exit
}

QUERY_DATA_GIVEN_THE_ELEMENT_ID(){
  QUERY_RESULT=$($PSQL "SELECT name, symbol, type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  IFS='|' read -r ELEMENT_NAME ELEMENT_SYMBOL ELEMENT_TYPE ELEMENT_MASS ELEMENT_MELTING_POINT ELEMENT_BOILING_POINT <<< $QUERY_RESULT
  echo -e "The element with atomic number $1 is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."

}

if [[ -z $1 ]]
  then
  echo Please provide an element as an argument.
  exit 0
fi

# if it is a number
if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
    if [[ -z $ELEMENT_ATOMIC_NUMBER ]]
      then
        ELEMENT_NOT_FOUND

      else
        QUERY_DATA_GIVEN_THE_ELEMENT_ID $ELEMENT_ATOMIC_NUMBER
    fi

    else
      ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1' OR symbol = '$1'")
      if [[ -z $ELEMENT_ATOMIC_NUMBER ]]
        then
          ELEMENT_NOT_FOUND
        
        else
          QUERY_DATA_GIVEN_THE_ELEMENT_ID $ELEMENT_ATOMIC_NUMBER
      fi

fi
