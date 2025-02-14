# Book Lending App

A simple Rails 8 application for borrowing and returning books. Users can sign up, browse books, borrow available books, return them, and see which books they currently have.

## Features

- **User Authentication**  
  Sign up, log in, and log out (using Rails’ built-in `has_secure_password`).
- **Books Management**  
  - View a list of all books with availability status  
  - View details of each book  
- **Borrowing System**  
  - Borrow a book (creates a Borrowing record with a default due date set to two weeks from the borrowing date)  
  - Return a book (updates the Borrowing record, marking it as returned)  
  - Prevents borrowing an already borrowed book  
- **User Profile**  
  - Shows the current user’s borrowed books and due dates  
  - Allows returning borrowed books  

## Prerequisites

- **Ruby** 3.4.1 (or the version you’re using)
- **Rails** 8.0 (or the version you’re using)
- **PostgreSQL** (for the database)
- **Node.js** and **Yarn** (for Webpacker)
- **Bundler** (for managing Ruby gems)

## Getting Started

1. **Clone the Repository**  
   ```bash
   git clone https://github.com/yourusername/book-lending-app.git
   cd book-lending-app

2. **Install Dependecies**
    ```bundle install
       yarn install --check-files

3. **Set Up the Database**
    ```Update config/database.yml with your      PostgreSQL credentials if needed.
    Create and migrate the database:
    bash
    Copy
    Edit
     ```rails db:create
        rails db:migrate
    (Optional) Seed the database with fake data:
    bash
    Copy
    Edit
    ```rails db:seed
       Run the Server

    bash
    Copy
    Edit
    ```rails server
       Visit http://localhost:3000 in your browser.

***Usage***
```Sign Up: Go to /users/new to create a new user account.
   Log In: Go to /login to sign in.
   Browse Books: Visit /books to see a list of all books. Each book shows if it’s Available or Borrowed.
  Borrow a Book: Click on a book’s title to view its details, then click Borrow this book (if available).
  Return a Book: Visit your profile page (e.g., /users/1) to see all books you’ve borrowed, then click Return Book next to each borrowed book.
***Testing***
  ```This project uses Rails’ default testing framework (MiniTest):

bash
Copy
Edit
rails test
Tests are organized under the test/ directory:

Models: test/models/
Controllers: test/controllers/
System Tests: test/system/ (if any)
***Deployment***
For deploying to a production environment (like Heroku):

Add a Production Database in config/database.yml (or use environment variables).
Precompile assets:
bash
Copy
Edit
rails assets:precompile
Run Migrations:
bash
Copy
Edit
rails db:migrate RAILS_ENV=production
Start the server (or follow your hosting provider’s instructions).
Project Structure
pgsql
Copy
Edit
book-lending-app
├── app
│   ├── controllers
│   │   ├── books_controller.rb
│   │   ├── borrowings_controller.rb
│   │   ├── sessions_controller.rb
│   │   └── users_controller.rb
│   ├── models
│   │   ├── book.rb
│   │   ├── borrowing.rb
│   │   └── user.rb
│   ├── views
│   │   ├── books
│   │   │   ├── index.html.erb
│   │   │   └── show.html.erb
│   │   ├── borrowings
│   │   ├── sessions
│   │   │   └── new.html.erb
│   │   ├── users
│   │   │   ├── new.html.erb
│   │   │   └── show.html.erb
│   │   └── layouts
│   │       └── application.html.erb
│   └── javascript
│       └── packs
│           └── application.js
├── config
│   ├── database.yml
│   ├── routes.rb
│   └── environment.rb
├── db
│   ├── migrate
│   ├── schema.rb
│   └── seeds.rb
├── test
│   ├── controllers
│   ├── models
│   └── test_helper.rb
├── Gemfile
└── README.md
Contributing
Contributions are welcome! To contribute:

Fork this repo.
Create a new feature branch (git checkout -b feature/my-feature).
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature/my-feature).
Create a new Pull Request.
License
This project is licensed under the MIT License (or whichever license you prefer).

Acknowledgments
Rails Guides for excellent documentation.
Faker for generating fake data in development.
The open-source community for providing the gems and libraries that power this project.
Copy
Edit


