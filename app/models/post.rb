class Post < ActiveRecord::Base


  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 299}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :bait


  private

  def bait
    if self.attributes.values.include?("Won't Believe")
      true
    elsif self.attributes.values.include?("You Won't Believe These True Facts")
      true
    elsif self.attributes.values.include?("Secret")
      true
    elsif self.attributes.values.include?("Top")
      true
    elsif self.attributes.values.include?("Guess")
      true
    else
      errors.add(:title, false)
    end
  end

end