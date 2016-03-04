class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, format: { with: /\d{10}/,
    message: "must be 10 digits"}
end
