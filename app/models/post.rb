class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :clickbait

  def clickbait
    unless has_clickbait_phrase?(title)
      errors.add(:title, "must include a click bait phrase")
    end
  end

  def has_clickbait_phrase?(field)
    ["Won't Believe", "Secret", /Top \d+/, "Guess"].any? do |bait|
      field.match(bait) if title
    end
  end
end

