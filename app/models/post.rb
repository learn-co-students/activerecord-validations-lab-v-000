require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait_title

  def clickbait_title
    allowable = ["Won't Believe", "Secret", "Top/\d+/", "Guess"]
    place = false
    allowable.each do |bait|
      if self.title && self.title.include?(bait)
        place = true
      end
    end

    unless place
      errors.add(:clickbait, "title isn't clickbait-y enough")
    end
  end
end
