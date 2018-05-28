class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :address
      t.string :title
      t.text :description
      t.float :price
      t.float :duration
      t.string :category
      t.string :photo

      t.timestamps
    end
  end
end
