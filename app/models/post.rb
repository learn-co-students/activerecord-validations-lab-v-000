
class Post < ActiveRecord::Base
  include ActiveModel::Validations
# binding.pry
  validates :title, presence: true, click_baity: true
  # validates :title, click_baity: true

  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
   
end




