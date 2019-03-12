class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category , inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :title_is_a_clickbait

  def title_is_a_clickbait

    unless title =~ /\b(Won't Believe|Secret|Top \d|Guess)\b/
      errors.add(:title, " is not a clickbait.")
    end
  end
end
