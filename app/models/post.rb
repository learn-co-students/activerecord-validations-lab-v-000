class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }, allow_nil: true
  validates :title, exclusion: { in: ["Won't Believe", "Secret", "Top ", "Guess", "True Facts"], message: "needs to be more click-baity" }
end
