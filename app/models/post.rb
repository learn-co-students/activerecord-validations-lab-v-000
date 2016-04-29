class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_must_be_clickbait


  def title_must_be_clickbait
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "Do you want this staff job at buzzfeed or not? Make the title clickbait")
    end
  end

end
