class Service < ApplicationRecord
	belongs_to :user
	attachment :image

  with_options presence: true do
    validates :service_name
    validates :price
    validates :working_time
  end	
end