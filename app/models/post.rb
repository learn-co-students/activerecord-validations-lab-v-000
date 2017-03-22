class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :is_clickbait

  def is_clickbait
    clickbait = [/Won't Believe/, /Secret/, /Top \d+/, /Guess/ ]
    clickbait.each do |phrase| 
      if phrase.match(title)
        return
      end
    end
    errors.add(:title, "must be clickbait")
  end
end
