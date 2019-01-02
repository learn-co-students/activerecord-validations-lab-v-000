
class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title =~ /Won't Believe/ 
      record.errors[:title] << 'More click-baity, please!'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
end
