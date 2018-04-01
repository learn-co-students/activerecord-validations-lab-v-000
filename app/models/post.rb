class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait_title
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  def clickbait_title
    if title.present? && !(title.include?("Won't Believe") || title.include?("Secret")  || title.include?("Guess") || title.match(/Top\s\d*/))
        errors.add(:title, "must be clickbait-y")
    end
  end
end
