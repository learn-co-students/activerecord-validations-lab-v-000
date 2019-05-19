class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?


  def clickbait?
    #I think I shouldn't have to check that it has a title
    if self.title
      if !self.title.include?("Won't Believe" || "Secret" || "Top /[0-9]/" || "Guess")
        errors.add(:title, "need more clickbait")
      end
    else false
    end
  end
end
