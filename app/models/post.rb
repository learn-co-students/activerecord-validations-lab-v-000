class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :baity_title

  def baity_title
    if title
      errors.add(:title, "is not baity enough.") unless title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
    end
  end
end
