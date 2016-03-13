class Post < ActiveRecord::Base
  #validates :post, {presence: true}
  validates :title, {presence: true}
  validates :content, length:{minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  def is_clickbait?
    #click_bait_array = ["Won't Believe", "Secret", "Top", "Guess"]
    if !title.nil? && !title.include?("Won't Believe" || "Secret"|| "Top" || "Guess")
       errors.add(:title, "This isnt click bait!")
     end
  end
end
