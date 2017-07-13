class Author < ActiveRecord::Base
  validates :name, :presence => true
  validates_uniqueness_of :name
  validates_format_of :phone_number, :with => /[0-9]{10}/
end
