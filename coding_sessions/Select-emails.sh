#!/bin/bash
grep -Eo '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' students-list_1023.txt > student-emails.txt
