class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 200 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  def is_clickbait?
    if title
      unless title.match(/Won't Believe/i) || title.match(/Secret/i) || title.match(/Top [0-9]*/i) || title.match(/Guess/i)
        errors.add(:title, "must be clickbait")
      end
    end
  end

end
