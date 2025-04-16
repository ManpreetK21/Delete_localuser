# Delete_localuser
This script is designed to delete the local users based on user input

## Description
The script does as follows:
 -Sets the administrator account as an environment variable and stores it in a variable. 
 -Prompts the user to enter 'y' to view active users. If any other input is provided, it prompts again for 'y'.
 -Assigns a variable to store all active users and then displays them. 
 -Then, prompts for the username(s) to delete (comma-separated) or 'q' to exit the script.
 -Accepts multiple usernames separated by commas and stores them in an array.
 -Verifies if each specified user to be deleted exists on the local machine.
 -Then, iterates through each specified user, attempts to remove the user, and displays any error messages encountered.
 -Then, iterates through each specified user, attempts to remove the user, and displays any error messages encountered.
 -It iterates until user asks to quit

 ## Special Note
 When setting up environmental variable, be sure to write the local username which one do not wish to be shown among active users

 ## What's Inside
 -The ps1 script file
 -ReadMe.MD
