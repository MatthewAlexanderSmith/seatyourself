class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.text :description
      t.string :picture_url
      t.integer :capacity
      t.belongs_to :user, index: true, foreign_key: true
      t.string :email

      t.timestamps null: false
    end
  end
end
