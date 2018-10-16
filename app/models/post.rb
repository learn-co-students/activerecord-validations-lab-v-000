class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :non_clickbait

  def non_clickbait
    case title
    when /(Won't Believe)/, /(Secret)/, /(Top)/, /(Guess)/
    else
      errors.add(:title, "must include clickbait")
    end
  end
end
