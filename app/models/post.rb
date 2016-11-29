class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum:250 }
  validates :summary, length: { maximum:250 }
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :my_validator

  def my_validator
    unless self.title == nil ||
           self.title.include?("Won't Believe") ||
           self.title.include?("Secret") ||
           self.title.include?("Top [number]") ||
           self.title.include?("Guess")
      errors.add(:title, 'Not clickbaity title!')
    end
  end
end
