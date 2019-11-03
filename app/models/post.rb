class MyValidator < ActiveModel::Validator
  def validate(record)
    clickbait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
     if clickbait.none? { |word| word.match(record.title) }
       record.errors[:title] << 'Title needs to be clickbaity'
     end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates_with MyValidator
end
