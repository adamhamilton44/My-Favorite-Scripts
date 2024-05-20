#!/bin/bash

echo "Enter the website name including http or https: "
read website
wget -r -p -U Mozilla --wait=10 --limit-rate=75K $website
