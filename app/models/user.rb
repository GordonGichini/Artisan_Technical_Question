class User < ApplicationRecord
    has_secure_password

    has_many :borrowings, dependent: :destroy
    has_many :borrowed_books, through: :borrowings, source: :book

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
