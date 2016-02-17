# class CategoryValidators <ActiveModel::Validator
#   def validate(record)
#     if record.category != 'Fiction' || record.category != 'Non-Fiction'
#       record.errors[:category] << "Category must be fiction or non fiction"
#     end
#   end
# end
require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {:minimum => 250}
  validates :summary, length: {:maximum => 250}
  # validates_with CategoryValidators
  validate :category_cannot_be_anything
  validate :title_must_be_clickbait

  def category_cannot_be_anything
    # binding.pry
    if category != 'Fiction' && category != 'Non-Fiction'
      errors.add(:category, "Must be fiction or nonfiction")
    end
  end

  def title_must_be_clickbait
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "Title isn't clickbait")
    end
  end
end