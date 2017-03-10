class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait
end



def clickbait
  if self.title != nil
    title_arr = self.title.split(" ")
    clickbait = ["Won't", "Believe", "Secret", "Top", "Guess"]
    if title_arr - clickbait == title_arr
      self.errors.add(:title, "please make it clickbait")
    end
  end
end
