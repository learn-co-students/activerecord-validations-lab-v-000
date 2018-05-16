class Post < ActiveRecord::Base
  # validate :title_must_contain_click_bait
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :not_clickbait

  def not_clickbait
    unless title.present? && title == "Won't Believe" || "Secret" || "Top[number]" || "Guess"
      errors.add(:title, "Title needs more click-bait!!")
    end
  end


end
