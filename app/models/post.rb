class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "custom message" }
  validate :click_bait

  def click_bait
    if title.present?
      if !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess"))
        errors.add(:title, "Title is not clickbait")
      end
    end
  end

end 
