class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity

  def clickbaity
    if title == nil
      false
    else
      if title.include?("Won't Believe") || title.include?("Secret") || title.match(/Top\s\d/) || title.include?("Guess")
        true
      else
        errors.add(:title, "not clickbaity enough")
      end
    end
  end
end
