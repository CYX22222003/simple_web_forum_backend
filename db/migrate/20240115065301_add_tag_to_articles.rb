class AddTagToArticles < ActiveRecord::Migration[7.1]
  def change
    add_reference :articles, :tag, null: false, foreign_key: true
  end
end
