#!/bin/bash

read -sp "Enter your password: " PASSWORD #prompts the user to enter their password and stores it
echo
PASSHASH=$(echo "$PASSWORD" | sha256sum) #calculate the hash of the password entered
FILEHASH=$(cat ./secret.txt) #reads the contents of the secret.txt file and sets that as the variable
if [ "$PASSHASH" == "$FILEHASH" ] #compares the hash of the input to the hash in the file
then echo "Access Granted"
exit 0
else echo "Access Denied"
exit 1
fi
