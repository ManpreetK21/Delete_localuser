# Delete_localuser
This script is designed to delete the local users based on user input

## Description
The script does as follows:
 1.Sets the adminstrator account as enviornmnetal variable to avoid accidental deletion by other users and stores it in a variable
 2.Ask for user to enter 'y' to see active users and if user enters anything else, asks again to enter y
 3.Assign a variable to store all active users and then display it 
 4.Then, the second prompt asks for the name of the user to be deleted or an option to exit the script
 5.The prompt will accept more than one inout seperated by comma and stores it in array
 6.After the storing the input, it verifies if the user to be deleted exists in the local machine
 7.Then each user will go through a loop which removes the user and if there is an error code, displays the error message
 8.If user does not exist, it displays the message the user does not exist
 9.It iterates until user asks to quit

 ## Special Note
 When setting up environmental variable, be sure to write the local username which one do not wish to be shown among active users

 ## What's Inside
 -The ps1 script file
 -ReadMe.MD
