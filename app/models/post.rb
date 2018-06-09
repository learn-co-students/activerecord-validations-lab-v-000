class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 25 }
  validates :summary, length: { maximum: 100}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    @clickbait_words = [/Won't Believe/i,/Secret/i, /Top [0-9]*/i,/Guess/i]
    if @clickbait_words.none? {|word| word.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
