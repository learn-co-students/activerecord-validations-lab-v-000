class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 100}
  validates :category, inclusion: { in: %w{Fiction Non-Fiction}}
  validate :click_bait?


  def click_bait?
      if !self.title || !self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors[:title] = "This post isn't click bait"
    end
  end
end


