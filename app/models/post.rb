class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  # validates :title, inclusion: { in: %w(Won't Believe Secret Top [0-9]* Guess) }
  validate :is_clickbait

  def is_clickbait
    if title != nil && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
       errors.add(:title, "not clickbait")
    end
  end
end
