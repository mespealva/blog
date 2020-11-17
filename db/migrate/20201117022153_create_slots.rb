class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.references :availability, foreign_key: true
      t.boolean :available

      t.timestamps
    end
  end
end
