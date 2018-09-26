class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, format: { with: /\d{3}\d{3}\d{4}/, message: "bad format" }
end
