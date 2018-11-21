class Author < ActiveRecord::Base
  validates :name, uniqueness:true, presence: true
  validates :phone_number, numericality: {only_integer: true}, length: {is: 10}
end
