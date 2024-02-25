#!/bin/bash

# Functions

add_student() {
  read -p "Enter student email: " email
  read -p "Enter student age: " age
  read -p "Enter student ID: " id

  if ! grep -qE "^$id," students-list_1023.txt; then
    echo "$id,$email,$age" >> students-list_1023.txt
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

  if grep -qE "^$id," students-list_1023.txt; then
    sed -i "/^$id,/d" students-list_1023.txt
    echo "Student deleted successfully!"
  else
    echo "Error: Student with ID $id not found!"
  fi
}

update_student() {
  read -p "Enter student ID to update: " id

  if grep -qE "^$id," students-list_1023.txt; then
    student=$(grep -m 1 -E "^$id," students-list_1023.txt);
    old_email=$(echo $student | cut -d, -f2)
    old_age=$(echo $student | cut -d, -f3)

    read -p "Enter new email (leave blank if unchanged): " new_email
    read -p "Enter new age (leave blank if unchanged): " new_age

    sed -i "s/^$id,.*/$id,${new_email:-$old_email},${new_age:-$old_age}/g" students-list_1023.txt

    echo "Student updated successfully!"
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

