class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_baity?

  def click_baity?
    if title
      if(!title.match(/Won't Believe/i) && !title.match(/Secret/i) && !title.match(/Top [0-9]*/i) && !title.match(/Guess/))
        errors.add(:title, "Must be click bait")
      end
    end
  end
end
