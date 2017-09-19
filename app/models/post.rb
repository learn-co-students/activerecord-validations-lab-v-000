class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

  validate :clickbait

  def clickbait
    clickbaits = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]
    return unless title
    unless clickbaits.any? { |clickbait| clickbait.match(self.title) }
      self.errors[:title] << 'Need a more clickbait-y title!'
    end
  end


end
