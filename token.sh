#!/bin/sh
source .env

echo Settings new token:
echo $TOKEN

find ./source/ -type f -iname "*.xml" -exec sed -i '' -E "s/(token\=)([a-z0-9]*)([&?])/\1${TOKEN}\3/g" {} +