
class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction) }
  validate :non_clickbait

  def non_clickbait
    clickbait = ["Won't Believe", "Secret", "Top[number]", "Guess"]

    if self.title && !clickbait.detect {|t| self.title.include?(t)}
      errors.add(:non_clickbait, 'this is not clickbait')
    end
  end

end
