class Post < ActiveRecord::Base
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :title_must_be_click_bait

  private

  def title_must_be_click_bait
    unless title && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess") || title.include?("Top \d"))
      errors.add(:title, "Must be sufficiently click-baity")
    end
  end

end
