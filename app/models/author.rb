class Author < ActiveRecord::Base
  validates :name, length: {minimum: 2}
  validates :phone_number, length: {is: 10}
  validates :name, :phone_number, uniqueness: true
end
