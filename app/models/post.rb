class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction NonFiction) }
  validates :title_valid, acceptance: true

  def title_valid
    clickbait = ["Won't Believe","Secret","Top /\d/ ","Guess"]
    if title && clickbait.none? {|word| title.include? word}
      errors.add(:title, "must have clickbait-y words")
    end
  end
end
