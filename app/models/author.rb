class Author < ActiveRecord::Base

	validates :name, presence: true
	validates_length_of :phone_number, minimum: 10, maximum: 10
	validates_uniqueness_of :name

end
