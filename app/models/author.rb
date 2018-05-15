class Author < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name
  validates :phone_number, format: { with: /\A[0-9]{10}\z/,
    message: "only allows 10 digits" }
end
