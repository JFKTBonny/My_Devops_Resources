#!/bin/bash

TO="santonix@hotmail.it"
SUBJECT="Greetings from msmtp"
BODY="Hey! How are you doing?"

echo "$BODY" | mail -s "$SUBJECT" "$TO"


# how to run: chmod +x send_mail.sh &&  ./send_mail.sh
