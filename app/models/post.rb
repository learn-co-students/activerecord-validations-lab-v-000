class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
  message: "%{value} is not a valid category" }
  validate :clickbait_title

  def clickbait_title
    if title != nil
      unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top [/\d+/]") || title.include?("Guess")
        errors.add(:title, 'Your title is not click bait!')
        return false
      end
    end
  end

end
