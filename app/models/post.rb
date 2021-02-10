class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :clickbait, confirmation: true

  def clickbait
    bait = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    if title
      if bait.none? {|word| title.include?(word)}
        errors[:title] << "Must be clickbait"
      end
    end
  end

end
