class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, length: { in: 10..11 }
  validates :name, uniqueness: true

end
