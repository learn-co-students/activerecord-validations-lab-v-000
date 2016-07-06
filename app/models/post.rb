class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, length:{minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion: { in: %w(Fiction) }
  validates :title, inclusion: { in: ["You Won't Believe These True Facts"]}
end


#def click_bait
 # until title.include?("You Won't" || "Secret" || "Top" || "Guess")
  #  errors.add(:click_bait, "This is click bait")
 # end
#end