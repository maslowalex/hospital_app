class Hospital < ApplicationRecord
	has_and_belongs_to_many :workers, dependent: :destroy
	validates :number, length: { minimum: 2 }
	
	def actual_workers
		self.workers.select(:surname, :position, :id)
	end

	def include_worker? worker_id
		self.worker_ids.include?(worker_id)
	end

	def avialiable_workers
		Worker.all - self.workers
	end
end
