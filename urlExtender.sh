#!/bin/bash

echo "Enter the short url: "
read shorturl
curl --silent -I -L $shorturl | grep -i location
