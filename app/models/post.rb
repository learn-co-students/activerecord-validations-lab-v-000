class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title, :click_baity

  def click_baity
    check = false
    if self.title && self.title.include?("Won't Believe")
      check = true
    elsif self.title && self.title.include?("Secret")
      check = true
    elsif self.title && self.title.include?("Top ")
      check = true
    elsif self.title && self.title.include?("Guess")
      check = true
    else
      errors.add(:title, "Not click-baity enough")
    end
    check
  end
end
