class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_cannot_be_spammy

  def title_cannot_be_spammy
    unless title && ["Won't Believe", "Secret", "Top [number]", "Guess"].any? {|text| title.include?(text)}
      errors.add(:title, "is Spammy")
    end
  end
end
