class Post < ActiveRecord::Base
  validates_presence_of :title  
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} must be either Fiction or Non-Fiction"}
  
  include ActiveModel::Validations
  validates_with ClickBaitValidator
end
