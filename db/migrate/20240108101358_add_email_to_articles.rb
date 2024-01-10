class AddEmailToArticles < ActiveRecord::Migration[7.1]
  def change
    add_reference :articles, :email, foreign_key: true
  end
end
