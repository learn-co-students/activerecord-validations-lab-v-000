class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbaity_enough?

    WORDS = [/Won\'t Believe/, /Secret/, /Guess/, /Top\s\n/]

  def is_clickbaity_enough?
    if WORDS.none? {|word| word.match(title) }
      errors.add(:title, "not clickbaity enough")
    end
  end

end
