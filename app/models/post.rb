class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait

  private

  def non_clickbait
    phrases = [/Won't Believe/, /Guess/, /Top \d+/, /Secret/]
    unless phrases.any? {|phrase| phrase.match(self.title)}
      errors.add(:title, "Must be clickbait")
    end
  end
end
