class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, length: { is: 10 }
  validates_uniqueness_of :name, :phone_number
end
