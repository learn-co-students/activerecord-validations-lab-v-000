# class ValidClickBait < ActiveModel::Validator
#   def validate(record)
#     !record.title.nil? && record.title.scan(/(Won't Believe|Guess|Secret|Top \d+)/).empty?
#   end
# end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  # validates_with ValidClickBait
  validate :valid_click_bait

  def valid_click_bait
    if title.nil? || title.scan(/(Won't Believe|Guess|Secret|Top \d+)/).empty?
      errors.add(:title, "Not Click-Baity enough.")
    end
  end
end

