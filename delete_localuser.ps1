<# This script is written automate the task of deleting user by providing the desired username to be delteted #>

#First it created a environmental variable local machine wide to avoid accidental deletion of Administrator 
[system.environment]:: SetEnvironmentVariable("host_name", "<Username>", "Machine") #Write the admin user name in place of <Username>

#below stores the environmental variable in a script variable to make it convenient to use 
$hostname = $env:host_name

#This prompt stores user input to see active users
$ans = Read-Host "Please enter y to see active user: " 

#If the input is not y or n, there is do while loop which repeats until user input is either y 
If ($ans.toUpper() -ne "Y"){
    do { $ans = Read-Host "Please input either a 'Y' for yes : "}
    while ($ans.toUpper() -ne "Y" ) #Continues the loop until valid input ('Y') is received
    }
#Stores all active users (excluding the admin defined by $hostname)
$Loc_Users = Get-LocalUser | Where-Object {$_.enabled -eq $true -and $_.name -ne $hostname} 

Write-Host $Loc_Users | Format-table #Prints the active users

#here do while is used to ask for a name for the users to be deleted and it is repeated until user inputs q to quit
Do {
#This do-while loop prompts for usernames to delete (comma-separated) or 'q' to quit.
$users_input = Read-Host "Please enter user you would like to delete (If its more than one user, use "," to seperate ) or enter 'q' to exist : " 
   If ($users_input -ceq "q") {#if user inputs q, exit the script
    break #break statement
    } else { # else if inputs is any name or character other than q
     $multi_user = $users_input.Split(',') | ForEach-Object { $_.Trim() } #Splits the input into an array of usernames ($multi_user)

       Foreach($us_er in $multi_user){ # Iterates through each username in the $multi_userarray

        $user_exist = $Loc_Users | Where-Object ($_.name -eq $us_er) #checks for each user if it exits and stores it in us_er variable which is loop specific

        #If the user exists...
          If ($user_exist){ 

           #tries to delete user and in case an error is genrated, it catches the code and display the error message in catch statement
            try{ # removes the user which is currently in foreach loop  
            Remove-LocalUser -Name $us_er -confirm #Prompts for confirmation before deleting
            write-host "$us_er deleted successfully" #Displays a success message
            }
            catch { 
            Write-Error "Error deleting $us_er : $($_.Exception.Message)" #Displays an error message if deletion fails
            }
   
         } else{ #If the user is not found...
         Write-Warning "User $us_er not found on this system. Please try again."
        }
      }
     }
         }while ($users_input -ne "q") # Continues the loop until the user enters 'q'
