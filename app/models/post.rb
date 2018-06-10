

class Post < ActiveRecord::Base
  validates :title, presence: true#, clickbait: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  # validates_with ClickbaitValidator
  validate :clickbaity

  private
  def clickbaity
    if self.title
      unless self.title.match(/(Won't Believe|Secret|Top \d*|Guess)/)
        errors[:title] << "That's not sufficiently clickabait-y!"
      end
    end
  end

end
