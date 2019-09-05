class Post < ActiveRecord::Base
  
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { in: 6..20 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :clickbait

  private
  def clickbait
    clickbait_arr = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    if clickbait_arr.none? do |i|
      i.match(title)
    end
      self.errors[:title] << "You need to be more clickbait-y"
    end
  end
end
