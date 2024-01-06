class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :reviewer
      t.text :review_bd
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
