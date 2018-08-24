class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :surname
      t.integer :birth_year
      t.integer :position, index: true, default: 0
      t.timestamps
    end
  end
end
