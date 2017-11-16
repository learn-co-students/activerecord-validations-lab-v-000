class Post < ActiveRecord::Base
  include
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validate :clickbaity_title

  def clickbaity_title
    if title == nil
      false
    else
      acceptable_titles = ["Won't Believe", "Secret", "Top", "Guess"]
      acceptable_titles.each do |clickbait|
        if !title.include?(clickbait)
          errors.add(:title, "Your Title isn't clickbaity!")
        else
          return true
        end
      end
    end
  end
end
