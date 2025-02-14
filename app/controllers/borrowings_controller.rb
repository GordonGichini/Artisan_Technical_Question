class BorrowingsController < ApplicationController
    before_action :require_login
  
    def create
      @book = Book.find(params[:id])
      if @book.available?
        @borrowing = current_user.borrowings.build(book: @book)
        if @borrowing.save
          redirect_to user_path(current_user), notice: "Book borrowed successfully! Due date: #{@borrowing.due_date}"
        else
          redirect_to book_path(@book), alert: "Could not borrow book: #{@borrowing.errors.full_messages.join(', ')}"
        end
      else
        redirect_to book_path(@book), alert: "Book is already borrowed."
      end
    end
  
    def update
      # For returning the book, we update the borrowing record to mark it as returned 
      @borrowing = current_user.borrowings.find(params[:id])
      if @borrowing.update(returned: true)
        redirect_to user_path(current_user), notice: "Book returned successfully."
      else
        redirect_to user_path(current_user), alert: "Could not return book."
      end
    end
  
    private
  
    def require_login
      unless logged_in?
        flash[:alert] = "Please log in to perform this action."
        redirect_to login_path
      end
    end
  end
  