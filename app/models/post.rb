class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: {maximum: 250 }
  validates :content, length: {minimum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
  validate :click_bait

   CLICKY = %q(Won't Believe Secret Top Guess)

    def click_bait
      if title && !title.include?("Won't Believe" || "Secret" || "Top [Number]" || "Guess")
        errors.add(:title, "Not clicky enough")
      end
    end


end
