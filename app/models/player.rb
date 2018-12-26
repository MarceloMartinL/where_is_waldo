class Player < ApplicationRecord
	has_many :scores

	def self.guest_name
		"Guest #{Player.count + 1}"
	end
end
