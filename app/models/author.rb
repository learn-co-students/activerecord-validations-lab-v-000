class Author < ActiveRecord::Base
  # add validators for name presence and uniqueness
  # Also need a validator for phone numbers. need to be 10 digits.
  validates :name, presence: true
  validates :phone_number, length: { is: 10 }
  validates :name, uniqueness: true
end
