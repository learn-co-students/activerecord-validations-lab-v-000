class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  def is_clickbait?
    if title
      unless title.match(/Won't Believe/) || title.match(/Secret/) || title.match(/Top [0-9]/) || title.match(/Guess/)
        errors.add(:title, "title must say clickbait")
      end
    end
  end

end
