

class Post < ActiveRecord::Base

  include ActiveModel::Validations
  validates_with ClickBaitValidator


  validates :title, presence: true
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 200}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end


