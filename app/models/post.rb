class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.category != "Fiction" && record.category != "Non-Fiction"
      record.errors[:base] << "Category needs to be Fiction or Non-Fiction"
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates_with GoodnessValidator
  validates :title, format: {with: /Won't Believe|Secret|Top\s\d|Guess/}
end
