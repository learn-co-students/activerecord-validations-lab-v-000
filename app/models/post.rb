class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :click_baity

  def click_baity
    phrases = [/Won't Believe/, /Secret/, /Guess/, /Top \d+/]
    unless phrases.any? { |phrase| phrase.match(self.title) }
      errors.add(:title, "Must be click baity")
    end
  end
end
