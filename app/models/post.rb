



class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbaity

  def clickbaity
    self.title.split.each do |word|
    if ["Won't Believe","Secret","Top[number]","Guess"].include?(word)
      errors.add(:clickbaity, "Not clickbaity")
    end
  end
end
