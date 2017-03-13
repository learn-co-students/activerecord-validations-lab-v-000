
class MyValidator < ActiveModel::Validator
  def validate(post)
       return if !post.title
      if post.title.include?("Won't Believe") || post.title.include?("Secret") || post.title.include?("Top[number]") || post.title.include?("Guess")
    else
      post.errors[:name] << 'Title should be clickbait-y'
    end
end
end


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, presence: true
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
   include ActiveModel::Validations
   validates_with MyValidator
end
