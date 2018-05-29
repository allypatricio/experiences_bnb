class RemoveDateAndAddDateTimeToBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :date
    add_column :bookings, :date_time, :datetime
  end
end
