class CreateBreeds < ActiveRecord::Migration[7.2]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :bred_for
      t.string :life_span
      t.string :image_url
      t.references :shelter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
