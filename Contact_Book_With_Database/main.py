import mysql.connector

# Connect to MariaDB
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='1234',
    database='contact_db',
    charset='utf8mb4',
    collation='utf8mb4_general_ci'
)

cursor = conn.cursor()

# Function to add a contact
def add_contact(name, email, phone):
    try:
        query = "INSERT INTO contacts (name, email, phone) VALUES (%s, %s, %s)"
        cursor.execute(query, (name, email, phone))
        conn.commit()
        print("Contact added successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Function to display all contacts
def show_contacts():
    try:
        query = "SELECT * FROM contacts"
        cursor.execute(query)
        contacts = cursor.fetchall()
        if contacts:
            for contact in contacts:
                print(f"ID: {contact[0]}, Name: {contact[1]}, Email: {contact[2]}, Phone: {contact[3]}")
        else:
            print("No contacts found.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Main menu
def main_menu():
    while True:
        print("\n1. Add Contact")
        print("2. Show Contacts")
        print("3. Exit")
        choice = input("Enter your choice: ")

        if choice == '1':
            name = input("Enter name: ").strip()
            email = input("Enter email: ").strip()
            phone = input("Enter phone number: ").strip()
            add_contact(name, email, phone)
        elif choice == '2':
            show_contacts()
        elif choice == '3':
            print("Exiting Program. Goodbye!")
            break
        else:
            print("Invalid Choice. Please try again.")

# Close the connection
try:
    main_menu()
finally:
    cursor.close()
    conn.close()