class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 200}
  validates :summary, length: { maximum: 200}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    unless title && title.match(/(Won't Believe)|(Secret)|(Top \d)|(Guess)/)
      errors.add(:title, 'is not clickbait')
    end
  end


end
