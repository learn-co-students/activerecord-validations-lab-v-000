class PostTitleValidator < ActiveModel::Validator
  def validate(record)
    unless !!record.title && record.title.match(/\b(?:Won't Believe|Secret|Guess|Top [0-9]*)\b/)
      record.errors[:title] << 'Title must be clickbait-y!'
    end
  end
end

class Post < ActiveRecord::Base
  validates_with PostTitleValidator
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
