class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :experience, foreign_key: true
      t.string :date
      t.string :status

      t.timestamps
    end
  end
end
