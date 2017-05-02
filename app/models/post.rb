class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
# validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

  validate :clickbait

  def clickbait
    if title
      if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Guess")
        errors.add(:title, "has to include clickbait text")
      end
    end
  end
end
