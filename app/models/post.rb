class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-fiction"]}
  validate :is_clickbait

  def is_clickbait
    if title.present?
      unless title.match /Won't Believe | Secret | Top \d+ | Guess/
        errors.add(:title, 'is not clickbait')
      end
    end
  end

end
