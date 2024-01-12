class DropAuthors < ActiveRecord::Migration[7.1]
  def self.up
    drop_table :authors
  end
end
