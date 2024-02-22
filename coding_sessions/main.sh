#!/bin/bash

# Functions

add_student() {
  read -p "Enter student email: " email
  read -p "Enter student age: " age
  read -p "Enter student ID: " id

  if ! grep -q "$id" students-list_1023.txt; then
    echo "$email,$age,$id" >> students-list_1023.txt
    echo "Student added successfully!"
  else
    echo "Error: Student with ID $id already exists!"
  fi
}

view_students() {
  if [[ -f students-list_1023.txt ]]; then
    cat students-list_1023.txt | tr ',' ' '
  else
    echo "No students found."
  fi
}

delete_student() {
  read -p "Enter student ID to delete: " id

  if grep -q "$id" students-list_1023.txt; then
    sed -i "/$id/d" students-list_1023.txt
    echo "Student deleted successfully!"
  else
    echo "Error: Student with ID $id not found!"
  fi
}

update_student() {
  read -p "Enter student ID to update: " id

  if grep -q "$id" students-list_1023.txt; then
    new_email=""
    new_age=""

    read -p "Enter new email (leave blank if unchanged): " new_email
    if [[ -n "$new_email" ]]; then
      old_email=$(grep -o ",[^,]*\$" students-list_1023.txt | grep -w "$id")
      sed -i "s/$old_email/$new_email/" students-list_1023.txt
    fi

    read -p "Enter new age (leave blank if unchanged): " new_age
    if [[ -n "$new_age" ]]; then
      old_age=$(grep -o ",[^,]*" students-list_1023.txt | grep -w "$id" | cut -d ',' -f 2)
      sed -i "s/$old_age/$new_age/" students-list_1023.txt
    fi

    echo "Student updated successfully."
  else
    echo "Error: Student with ID $id not found!"
  fi
}

# Main loop

while true; do
  echo "Menu:"
  echo "1. Add student"
  echo "2. View students"
  echo "3. Delete student"
  echo "4. Update student"
  echo "5. Exit"

  read -p "Enter your choice: " choice

  case $choice in
    1) add_student;;
    2) view_students;;
    3) delete_student;;
    4) update_student;;
    5) exit;;
    *) echo "Invalid choice";;
  esac
done

