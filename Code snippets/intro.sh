#!/bin/bash

# Display current working directory
echo "Your current working directory is:"
pwd

# List contents of current directory
echo -e "\nContents of the current directory:"
ls -l

# Create a new directory
echo -e "\nCreating a new directory called 'test_dir'..."
mkdir test_dir

# Change to the new directory
cd test_dir

# Create a simple text file
echo "This is a test file." > test_file.txt

# Display contents of the file
echo -e "\nContents of test_file.txt:"
cat test_file.txt

# Use a loop to create multiple files
echo -e "\nCreating files file1.txt to file5.txt..."
for i in {1..5}
do
    echo "This is file number $i" > "file$i.txt"
done

# List all text files in the directory
echo -e "\nListing all .txt files:"
ls *.txt

# Use grep to find a specific pattern
echo -e "\nFiles containing the word 'number':"
grep -l "number" *.txt

# Count words in all text files
echo -e "\nTotal word count in all text files:"
wc -w *.txt | tail -n 1

# Return to the parent directory
cd ..

# Remove the test directory and its contents
echo -e "\nRemoving the test directory..."
rm -r test_dir


