class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.integer :number, default: 0
      t.timestamps
    end
  end
end
