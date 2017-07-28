class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :event_friendly_id, :index => true
      t.integer :user_id, :index => true
      t.timestamps
    end
  end
end
