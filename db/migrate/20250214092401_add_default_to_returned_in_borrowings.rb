class AddDefaultToReturnedInBorrowings < ActiveRecord::Migration[7.2]
  def change
    change_column_default :borrowings, :returned, from: nil, to: false

    # Optional: enforce that it can't be nil going forward
    change_column_null :borrowings, :returned, false, false
  end
end
