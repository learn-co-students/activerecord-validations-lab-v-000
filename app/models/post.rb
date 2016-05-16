class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :clickbaity

  def clickbaity
    clickbait = [
      "Won't Believe",
      "Secret",
      "Top",
      "Guess" ]
    
    reg = /#{clickbait.map{|w| Regexp.escape(w)}.join('|')}/
    unless reg === title
      errors.add(:title, "Not click bait")
    end
  end
end
