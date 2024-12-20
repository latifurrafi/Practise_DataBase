import mysql.connector
import os

db_path = os.path.join(os.path.dirname(__file__), 'db', 'library_db.sql')
print(f"Path to library_db.sql: {db_path}")

from config.db_config import DB_CONFIG

# Initialize MySQL connection
def connect_to_db():
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        return conn
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

def initialize_database():
    conn = connect_to_db()
    if conn:
        cursor = conn.cursor()
        
        # Create the database if it doesn't exist, with the correct character set and collation
        cursor.execute('''
            CREATE DATABASE IF NOT EXISTS library_db
            CHARACTER SET utf8 COLLATE utf8_general_ci
        ''')
        
        # Use the library_db
        cursor.execute('USE library_db;')

        # Create the books table with the correct collation
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS books (
                id INT(11) NOT NULL AUTO_INCREMENT,
                title VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci,
                author VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci,
                isbn BIGINT(20) UNIQUE NOT NULL,
                pub_year INT(11) NOT NULL,
                price DECIMAL(10, 2) NOT NULL,
                quantity INT(11) NOT NULL,
                PRIMARY KEY (id)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ''')
        
        # Commit changes and close the connection
        conn.commit()
        conn.close()

# Database operations
def add_book_to_db(title, author, isbn, pub_year, price, quantity):
    conn = connect_to_db()
    if conn:
        try:
            cursor = conn.cursor()
            cursor.execute('''
                INSERT INTO books (title, author, isbn, pub_year, price, quantity)
                VALUES (%s, %s, %s, %s, %s, %s)
            ''', (title.title(), author.title(), isbn, pub_year, price, quantity))
            conn.commit()
            print("\t\tBook added successfully.")
        except mysql.connector.IntegrityError:
            print(f"Error: Book with ISBN {isbn} already exists.")
        finally:
            conn.close()

def remove_book_from_db(isbn):
    conn = connect_to_db()
    if conn:
        cursor = conn.cursor()
        cursor.execute('DELETE FROM books WHERE isbn = %s', (isbn,))
        conn.commit()
        removed = cursor.rowcount > 0
        conn.close()
        return removed

def search_book_in_db(isbn):
    conn = connect_to_db()
    if conn:
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM books WHERE isbn = %s', (isbn,))
        book = cursor.fetchone()
        conn.close()
        return book

def get_all_books():
    conn = connect_to_db()
    if conn:
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM books')
        books = cursor.fetchall()
        conn.close()
        return books

# Functions for user input
def add_books():
    title = input("Enter Book Title: ")
    author = input("Enter Author Name: ")
    isbn = int(input("Enter ISBN Number: "))
    pub_year = int(input("Enter Publishing Year: "))
    price = float(input("Enter Book Price: "))
    quantity = int(input("Enter Quantity: "))
    add_book_to_db(title, author, isbn, pub_year, price, quantity)

def remove_book():
    isbn_to_remove = int(input("Enter ISBN of the book to remove: "))
    if remove_book_from_db(isbn_to_remove):
        print(f"\t\tBook with ISBN {isbn_to_remove} removed successfully.")
    else:
        print(f"\t\tNo book found with ISBN {isbn_to_remove}.")

def search_books():
    isbn_to_search = int(input("Enter ISBN of the book to search: "))
    book = search_book_in_db(isbn_to_search)
    if book:
        print("\nBook Details:")
        print(f"Title: {book[1]}")
        print(f"Author: {book[2]}")
        print(f"ISBN: {book[3]}")
        print(f"Publishing Year: {book[4]}")
        print(f"Price: {book[5]}")
        print(f"Quantity: {book[6]}")
    else:
        print(f"\t\tNo book found with ISBN {isbn_to_search}.")

def view_all_books():
    books = get_all_books()
    if books:
        for book in books:
            print(f"Title: {book[1]} || Author: {book[2]} || ISBN: {book[3]} || Year: {book[4]} || Price: {book[5]} || Quantity: {book[6]}")
    else:
        print("No books found in the library.")

# Main menu
def main():
    initialize_database()
    while True:
        print("\n\t\tWelcome to Library Management System")
        print("\t\t\t1. Add Books")
        print("\t\t\t2. View All Books")
        print("\t\t\t3. Remove Book")
        print("\t\t\t4. Search Book by ISBN")
        print("\t\t\t5. Exit")
        option = input("Select an option: ")
        if option == "1":
            add_books()
        elif option == "2":
            view_all_books()
        elif option == "3":
            remove_book()
        elif option == "4":
            search_books()
        elif option == "5":
            print("\t\tThanks for using the Library Management System.")
            break
        else:
            print("\t\tInvalid choice. Please try again.")

if __name__ == "__main__":
    main()
