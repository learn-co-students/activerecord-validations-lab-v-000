class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, numericality: { only_integer: true  }, length: { is: 10 }
end
