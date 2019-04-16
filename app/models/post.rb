class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-fiction"]}
  validate  :is_click_bait?

  def is_click_bait?

    clickbait = [/Won't Believe/i, /Secret/i, /Top \d*/i, /Guess/i]
    if clickbait.none? { |c| c.match?(self.title)}
      self.errors.add(:title, "must be clickbait")
    end
    # if !self.title.include?("Won't Believe", ) || !self.title.include?("Secret") || !self.title.include?(/Top \d*/)  || !self.title.include?("Guess")
    #   self.errors.add(:title, "must be clickbait")
    # else
    #   self.errors.clear
    # end
  end
end
