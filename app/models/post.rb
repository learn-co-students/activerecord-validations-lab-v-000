class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Non-Fiction Fiction), message: "Not a valid genre" }
  validate :clickbait

  def clickbait
    clickbait = ["Won't Believe", "Secret", "Guess", "Top"]
    if self.title
      is_clickbait = clickbait.any? do |bait|
        self.title.include?(bait)
      end
    end
   errors.add(:title, "Must have clickbait title") unless is_clickbait
 end

end
