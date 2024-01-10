class CreateUsers2 < ActiveRecord::Migration[7.1]
  def up
    create_table :users, id: false do |t|
      t.string :username
      t.string :passwd
      t.references :email, foreign_key: true, primary_key: true
      t.timestamps
    end
  end
end
