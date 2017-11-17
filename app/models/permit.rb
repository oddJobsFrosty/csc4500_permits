class Permit < ApplicationRecord
	self.primary_key = :permit_id
	belongs_to	:user, optional: true
	has_one	:vehicle
	accepts_nested_attributes_for :vehicle

	def self.search(search)
		where("permit_id LIKE ? OR issued_by LIKE ? OR entered_by LIKE ?", "%#{search}%", "%#{search}", "%#{search}%")
	end
end
