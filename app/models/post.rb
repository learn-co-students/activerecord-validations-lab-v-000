class ClickBaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /Won't Believe|Secret|Guess|Top \d+/
      record.errors[attribute] << "Title must be clickbait-ey!"
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, click_bait: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}   
end
