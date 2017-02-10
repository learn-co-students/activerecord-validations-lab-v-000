class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  #Custom validator
  validate :is_click_baity

  def is_click_baity
    if title && !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess"))
      errors.add(:title, "not clickbait-y enough")
    end
  end
end
