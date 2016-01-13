class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length:  {maximum: 250}
  validates :category, inclusion: { in: ["Fiction"]}
  validate :click_bait


  def click_bait
    if !title.nil? && (!title.include? ("You Won't" || "Secret" || "Top" || "Guess"))
      errors.add(:click_bait, "This ain't click bait! You're fired!")
    end
  end

end
