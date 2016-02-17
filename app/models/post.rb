require 'pry'
VALID_TITLE_KEYWORDS = ["Won't Believe", "Secret", "Top[number]", "Guess"]

class TitleKeywordValidator < ActiveModel::Validator
  def validate(record)
    if record.title == nil
      record.errors[:title] << 'we need a title!'
      return false
    end
    VALID_TITLE_KEYWORDS.each do |keyword|
      if record.title.include?(keyword)
        return true
      end
      record.errors[:title] << 'Not clickbait-y enough!'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  #validates :title, presence: true
  validates_with TitleKeywordValidator
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
