class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"], message: "Category should be either Fiction or Non-Fiction" }
  validate :clickbait

  def clickbait
    if !(/won't believe|secret|top [0-9]*|guess/i).match title
      errors.add(:title, "must be clickbait")
    end
  end

end
