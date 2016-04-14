class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  # validates :title, inclusion: {in: %w('/.*(Won\'t Believe|Secret|Top|Guess).*/')}
  validate :post_category_type
  validate :clickbait


def post_category_type
  categories = ["Fiction", "Non-Fiction"]
  if !categories.include?(category)
    errors.add(:category, "not a valid category")
  end
end

def clickbait
  if !title.to_s.include?("Won't Believe" || "Secret" || "Top" || "Guess")
    errors.add(:title, "must be clickbait")
  end
end

end
