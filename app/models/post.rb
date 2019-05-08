class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 200}
  validates :summary, length: {maximum: 200}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :must_be_clickbaity

  def must_be_clickbaity
      case title
      when /(Won't Believe)/, /(Secret)/, /(Top)/, /(Guess)/
      else
        errors.add(:title, "must be clickbait-y")
      end
    
  end
end
