class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
  validate :clickbait

  def clickbait
    # binding.pry
    if self.title && ["Won't Believe", "Secret", "Top", "Guess"].all? { |e|  !title.include?(e)}
      errors.add(:title, 'is not clickbait')
    end
  end
end
