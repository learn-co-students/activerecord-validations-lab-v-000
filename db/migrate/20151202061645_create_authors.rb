class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :phone_number # I changed from string to integer

      t.timestamps null: false
    end
  end
end
