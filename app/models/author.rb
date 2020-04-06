class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  # 555305442 -> 9 numbers
  validates :phone_number, length: { is: 10 }
end
