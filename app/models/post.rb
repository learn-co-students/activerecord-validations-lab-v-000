class Post < ActiveRecord::Base
  include ActiveModel::Validations

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Nonfiction) }
  validate :my_custom_validator

  def my_custom_validator
    clickbait_pattern =
    [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
       /Guess/i
    ]
    if clickbait_pattern.none? {|pattern| pattern.match title}
      errors[:title] << 'Need a clickbait title!'
    end

  end


end
