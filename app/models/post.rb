class MyValidator < ActiveModel::Validator
  def validate(post)
    if post.title?
      unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|x| post.title.include? x}
        post.errors[:title] << 'Title is not clickbait-y!'
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  #validate :not_clickbaity
  include ActiveModel::Validations
  validates_with MyValidator

  #Alternative method to be used with "validate :not_clickbaity"
  #def not_clickbaity
  #  if title?
  #    unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|x| title.include? x}
  #      errors[:title] << 'Title is not clickbait-y!'
  #    end
  #  end
  #end

end
