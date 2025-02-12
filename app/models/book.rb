class Book < ApplicationRecord
    has_many :borrowings, dependent: :destroy

    validates :title, presence: true
    validates :author, presence: true 
    validates :isbn, presence: true, uniqueness: true 

    # determine availability based on active borrowings:
    def available?
        available && !borrowings.where(returned: false).exists?
    end
end
