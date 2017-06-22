class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, presence: true, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
      bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      if !title.nil? && !bait.any?{|phrase| title.include?(phrase) }
        errors.add(:title,"is not clickbait-y")
      end
   end
end
