class Post < ActiveRecord::Base
  validates :title, presence:true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_click_bait?
end


CLICK_BAIT = ["Won't Believe", "Secret", "Top[number]", "Guess"]

def is_click_bait?
    if !title.nil? && !CLICK_BAIT.any?{ |w| title.include? w}
      errors.add(:title, "must contain clickbait: #{CLICK_BAIT}")
    end
  end
