class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :vinyl, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date_begin
      t.date :date_end

      t.timestamps
    end
  end
end
