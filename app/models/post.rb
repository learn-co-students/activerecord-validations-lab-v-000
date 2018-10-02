class ClickBaitValidator < ActiveModel::Validator
  def validate(record)
    if record.title == nil
      false
    elsif !record.title.include?("Won't Believe")
      record.errors[:title] << 'Please make your title more clickbait-y'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: :true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with ClickBaitValidator
end
