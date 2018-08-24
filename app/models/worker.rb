class Worker < ApplicationRecord
  has_and_belongs_to_many :hospitals, dependent: :destroy
  enum position: [:doctor, :medsister, :fieldshire]
end
