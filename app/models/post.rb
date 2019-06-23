class MyValidator < ActiveModel::Validator
  def validate(post)
    if post.title
      unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any?{|x| post.title.include?(x)}
        post.errors[:title] << "Not clickbait-y enough"
      end
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates_with MyValidator
end
