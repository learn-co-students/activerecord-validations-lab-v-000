class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 100}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  CB = [
    /Won't Believe/,
    /Secret/,
    /Top [0-9]*/,
    /Guess/
  ]

  def is_clickbait?
    if CB.none? { |p| p.match title}
    end    
  end

end


