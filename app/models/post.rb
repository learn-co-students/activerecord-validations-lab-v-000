class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 80}
  validates :summary, length: {maximum: 100}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait_y?


  def clickbait_y?
    if !(/Won't Believe|Secret|Top [0..9]|Guess/i).match(title) #i -> case sensitive
      errors.add(:title, "this is not clickbait worthy!")
    end
  end
end
