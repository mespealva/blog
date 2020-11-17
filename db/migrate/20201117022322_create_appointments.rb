class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :slot, foreign_key: true
      t.references :user, foreign_key: { to_table: 'users' }
      t.references :client, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
