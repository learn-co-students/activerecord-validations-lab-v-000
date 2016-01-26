class Author < ActiveRecord::Base
  validates :name, presence: true #All authors have a name
  validates :name, uniqueness: true #No two authors have the same name
  validates :phone_number, length: { is: 10 } #Author phone numbers are exactly ten digits
end
