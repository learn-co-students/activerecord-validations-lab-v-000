class ClickbaitValidator < ActiveModel::EachValidator
  def validate(record)
    #binding.pry
    unless !!(record.title =~ /(Won't Believe|Secret|Top \d|Guess)/)
      record.errors.add(:title, "must be clickbait-y!")
    end
  end
end


class Post < ActiveRecord::Base
  validates :title, presence: true, clickbait: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
