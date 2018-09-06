class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_must_be_sufficiently_clickbaity

  def title_must_be_sufficiently_clickbaity
    if title
      if ["Won't Believe", "Secret", "Top", "Guess"].none? {|bait| title.include?(bait)}
        errors.add(:title, "must be more clickbaity")
      end
    end
  end
end
