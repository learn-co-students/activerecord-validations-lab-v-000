class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: {in: 10..15}
end
