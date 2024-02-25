# Negpod 12 Group Coding Summative

## Installing

To install, please clone the repository using the following git command:

```sh
git clone https://github.com/Stecie06/Second-Coding-Session/
```

## Running

### Question 1

#### a. ALU registration system

Run the file named `./main.sh`. It is used for the ALU registration system. It
will present you with a list of choices and you can choose different operations
by typing in the number required.

```
Menu:
1. Add student
2. View students
3. Delete student
4. Update student
5. Exit
```

For example, if you want to add a student, type in `1`. Choose a corresponding
number for other options.

The students will be saved at `students-list-1023.txt`

#### b. Searching and sorting into a file

Run the command `./Select-emails.sh` to get a list of all registered emails. The
list will be saved at `student-emails.txt`

### Question 2

#### a. Moving files

Running the script `./move-to-directory.sh` will move all files created in
Question 1 to the directory named `negpod_12-q1`.

#### b. Backup

The file named `./backup-Negpod_12.sh` will backup the directory created in the
previous step to the remote server.
