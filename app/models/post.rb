class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length:  {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :click_bait


  def click_bait
    if !title.nil? && (!title.include? ("You Won't" || "Secret" || "Top" || "Guess")) 
      errors.add(:click_bait, "We need more click bait." )
    end
  end

end
