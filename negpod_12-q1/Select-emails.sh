#!/bin/bash
cat students-list_1023.txt | cut -d, -f2 > student-emails.txt
