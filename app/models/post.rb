class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :bait?

  def bait?
    bait = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title
      if !bait.find {|word| self.title.include?(word)}
        errors.add(:title, "needs bait")
      end
    end
  end
end
