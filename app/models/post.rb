class Post < ActiveRecord::Base
  # validate :title_must_contain_click_bait
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :not_clickbait

  def not_clickbait
    baits = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    # errors.add(:title, "not_clickbait") if self.title.contains? ("Won't Believe") || self.title.conains? ("Secret") || self.title != "Top[number]" || self.title != "Guess"
    unless baits.any? {|bait| title.to_s.include?(bait)}
      errors.add(:title, "Not Clickbait!")
    end
  end


end

