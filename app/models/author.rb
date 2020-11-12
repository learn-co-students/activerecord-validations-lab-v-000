class Author < ActiveRecord::Base
	validates :name, {presence: true, uniqueness: true}
	validates :phone_number, format: { with: /\A[2-9]\d{2}\d{3}\d{4}\z/, message: "Not a US phone number." }
end
