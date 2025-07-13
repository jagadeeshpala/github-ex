#!/bin/bash

# This script calculates simple interest.

# Function to display a message box (since alert() is not allowed)
display_message() {
  echo "--- Message ---"
  echo "$1"
  echo "---------------"
}

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
  display_message "Usage: $0 <principal> <rate> <time>"
  display_message "Example: $0 1000 5 2"
  exit 1
fi

# Assign arguments to variables
principal=$1
rate=$2
time=$3

# Validate inputs are numbers
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  display_message "Error: All inputs must be valid numbers."
  exit 1
fi

# Calculate simple interest
# Formula: Simple Interest = (Principal * Rate * Time) / 100
# Using 'bc' for floating-point arithmetic
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Display the result
display_message "Principal: $principal"
display_message "Rate: $rate%"
display_message "Time: $time years"
display_message "Simple Interest: $simple_interest"

exit 0
