from krunker_api import krunker_api
from constants import ExitCode
import json
import os
import datetime
import time


def process_accounts(input_file):
    # Define the directory and file name
    output_directory = "Output files"
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    output_file_name = f"krunker_stats_{timestamp}.txt"
    output_file_path = os.path.join(output_directory, output_file_name)

    unprocessed_users = []
    total_accounts = 0
    processed_accounts = 0

    # Check if the directory exists, if not, create it
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    if not os.path.isfile(input_file):
        print()
        print(f"Error: The input file '{input_file}' does not exist.")
        return

    print(f"Reading accounts from: {input_file}")
    print()

    with open(input_file, 'r') as file:
        accounts = file.readlines()

    total_accounts = len(accounts)
    print(f"Total accounts to process: {total_accounts}")
    print()

    with open(output_file_path, 'w') as file:
        for index, account in enumerate(accounts, start=1):
            account = account.strip()
            if ':' not in account:
                print(f"Skipping invalid entry: {account}")
                continue

            username, password = account.split(':', 1)
            print(f"[{index}/{total_accounts}] Fetching stats for {username}...")

            attempt = 0
            success = False
            while attempt < 3 and not success:
                try:
                    data = krunker_api(username, show_window=False, load_images=False, debug=False)

                    if data is None:
                        raise ValueError("Failed to fetch data")

                    general_stats = data.get('general', {})
                    lvl = general_stats.get('lvl', 'N/A')
                    kr = general_stats.get('kr', 'N/A')
                    inventory = general_stats.get('inventory', 'N/A')

                    result = f"{username} : {password} : LVL={lvl} : KR={kr} : INVENTORY={inventory}\n"

                    file.write(result)
                    success = True
                    processed_accounts += 1
                    print(f"Successfully processed {username}.")
                    print()
                except TypeError as e:
                    print(f"TypeError: {e} for {username}. Logging as 'User does not exist'.")
                    print()
                    unprocessed_users.append((account, "User does not exist"))
                    success = True
                except Exception as e:
                    print(f"Error fetching stats for {username}: {e}")
                    attempt += 1
                    if attempt < 3:
                        print(f"Retrying ({attempt}/3)...")
                        time.sleep(5)
                    else:
                        unprocessed_users.append((account, str(e)))
                        print(f"Failed to process {username} after 3 attempts.")

    if unprocessed_users:
        with open(output_file_path, 'a') as file:
            file.write("\nUnprocessed Accounts:\n")
            for user, error in unprocessed_users:
                file.write(f"{user} - ERROR: {error}\n")

    print()
    print(f"Finished processing. Total accounts: {total_accounts}. Successfully processed: {processed_accounts}.")
    print()
    if unprocessed_users:
        print(f"User list has been appended to {output_file_path}.")
        print()


if __name__ == "__main__":
    input_file = input("Enter the path to the accounts file: ").strip()
    print()
    if not input_file:
        print()
        print("No input file path provided.")
    else:
        process_accounts(input_file)
