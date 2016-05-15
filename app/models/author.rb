class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :phone_number, length: { minimum: 10 }
end
