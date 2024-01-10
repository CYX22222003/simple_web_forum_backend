class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.string :address

      t.timestamps
    end
  end
end
