# 📚 Book Lending Library

## Overview
The **Book Lending Library** is a Ruby on Rails 8 application that allows registered users to browse available books, borrow and return books, and track their borrowed books. Authentication is implemented using Rails' built-in system, and the application includes validations, error handling, and tests.

## Features
✅ User Authentication (Sign Up, Login, Logout)
✅ Book Listing & Details Page
✅ Borrowing & Returning Books
✅ User Profile with Borrowed Books & Due Dates
✅ Validation & Error Handling
✅ Fully Tested Models & Controllers

## 🚀 Getting Started

### Prerequisites
Ensure you have the following installed:
- Ruby (3.x recommended)
- Rails 8
- PostgreSQL (or SQLite for local development)
- Bundler

### Installation
1. **Clone the repository**
   ```sh
   git clone https://github.com/Herman-Gathege/ruby-book-lending-app.git
   cd book_library
   ```
2. **Install dependencies**
   ```sh
   bundle install
   ```
3. **Set up the database**
   ```sh
   rails db:create db:migrate db:seed
   ```
4. **Start the server**
   ```sh
   rails server
   ```
5. Open [http://localhost:3000](http://localhost:3000) in your browser.

## 🛠 Usage

### User Authentication
- Register a new account or log in using existing credentials.
- Once logged in, you can browse books, borrow and return books.

### Borrowing a Book
- Click on an available book and press **Borrow**.
- The book will be marked as unavailable.

### Returning a Book
- Go to **My Borrowed Books**.
- Click **Return** on any borrowed book.
- The book will be marked as available again.

## 🧪 Running Tests
To run the test suite, use:
```sh
rails test
```
This will run model, controller, and integration tests.



## 🤝 Contributing
1. Fork the repository.
2. Create a new feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a Pull Request.



