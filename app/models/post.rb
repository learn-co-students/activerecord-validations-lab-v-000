class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait

  def clickbait
    case title
    when /(Won't Believe)/, /(Secret)/, /(Top) \d/, /(Guess)/
    else
      errors.add(:title, "Must be clickbait")
    end
  end
end
