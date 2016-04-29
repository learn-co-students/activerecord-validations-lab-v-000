class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, format: { with: /\A[0-9]{10}\z/ }
end
