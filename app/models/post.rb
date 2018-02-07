class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_check

  @@clickbait = ["Won't Believe", "Secret", "Top /[0-9]/", "Guess"]

  def title_check
    if self.title
      if !self.title.include?("Won't Believe" || "Secret" || "Top /[0-9]/" || "Guess")
        errors.add(:title, "More clickbait please")
      end
    else false
    end
  end

end
