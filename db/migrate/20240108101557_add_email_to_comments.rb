class AddEmailToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :email, foreign_key: true
  end
end
