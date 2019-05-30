# class MyValidator < ActiveModel::Validator
#   def validate(post)
#     unless !post.title.include?("won't believe") || !post.title.include?("top [number]") || !post.title.include?("secret") || !post.title.include?("guess")
#       post.errors[:title] << 'Needs a more click-baity title!'
#     end
#   end
# end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 250}
  validates :summary, presence: true, length: {maximum: 250}
  validates :category, presence: true, inclusion: { in: %w(Fiction Non-Fiction)}
end
