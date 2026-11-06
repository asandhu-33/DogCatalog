class CreateShelters < ActiveRecord::Migration[7.2]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :city
      t.string :email

      t.timestamps
    end
  end
end
