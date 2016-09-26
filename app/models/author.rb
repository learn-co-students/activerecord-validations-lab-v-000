class Author < ActiveRecord::Base
  # not valid without a name
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, length: {is: 10}

end
