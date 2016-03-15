class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?



  def clickbait?
    if title
      unless title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
        errors[:title] = "Try choosing a more catchy title"
      end
    end
  end

end
