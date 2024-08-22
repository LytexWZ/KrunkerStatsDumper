# Krunker Stats Dumper
Krunker Stats Dumper is a python project designed to automate the recovery of krunker player statistics.

This project uses an unofficial API to get the values from https://krunker.io/social.html?p=profile&q= and it adds them to a new .txt file. The tool is able to handle approximately 100 inputs inside a .txt file before getting blocked by captcha. 

Use different .txt files if you have more than 100 inputs

![image](https://github.com/user-attachments/assets/99fb173c-a6e9-4685-b9d1-7857910cc90d)


# Usage 

1- Download or clone this repository in any location you want

2- Run start.bat to start the tool

3- Select "No" to install the requirements

4- Enter the path of the txt file the accounts are stored to **

5- Wait for the tool to finish

-----------------------------------
**.txt file format:

The txt file *needs* to follow this format:

![image](https://github.com/user-attachments/assets/ad84785d-0ada-4be4-9b3c-d3088ced6737)

If you don't have the password of the account, you can just type *"Nil"* in the password field and ignore the output

# Output handling

The script will add a string in the console once it has processed the account, these are all the outputs that you can get:

- Successfully processed {username}.

    The script finished the task as intended and all the information will be added to the output file.

- Failed to process {username} after 3 attempts.

    After retrying 3 times, the tool failed. Check the output file for more info about the error.
  
- Skipping invalid entry: {account}
  
    The format of the account is not correct, change it so the program can work with it.

- The input file '{input_file}' does not exist.

    The path provided is not correct, check syntax

- Error fetching stats for {username}: list index out of range

    The tool has encountered a captcha and has not been able to obtain the data (It will make another attempt shortly)
  
- TypeError: {e} for {username}. Logging as 'User does not exist

    The username is incorrect or termed

# Contributors
theking7337#0 (https://github.com/TheKing7337)

Gave me the idea (and the money) to work on this

Danonino

Gave me the solution to the main issue of the API and helped in the coding process







