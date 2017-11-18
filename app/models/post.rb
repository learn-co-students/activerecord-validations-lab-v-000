class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :must_be_clickbait

  def clickbait #title must contain the words in the array. Must return true
    #if title does NOT contain these words, must return false
    #True Facts should return false
    #binding.pry
    !!title && ["Won't Believe", "Secret", "Top", "Guess"].any?{|word| title.include?(word)}
  end

  def must_be_clickbait
    if !clickbait
      errors.add(:clickbait, "must be clickbait")
    end
  end

end
