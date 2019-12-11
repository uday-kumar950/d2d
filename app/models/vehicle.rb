class Vehicle < ApplicationRecord
	has_many :service_trips,dependent: :destroy
end
