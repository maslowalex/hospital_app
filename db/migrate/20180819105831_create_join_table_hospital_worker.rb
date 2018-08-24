class CreateJoinTableHospitalWorker < ActiveRecord::Migration[5.2]
  def change
    create_join_table :hospitals, :workers do |t|
      t.index [:hospital_id, :worker_id]
      t.index [:worker_id, :hospital_id]
    end
  end
end
