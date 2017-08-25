class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_category


  def title_category
    if self.title
      if self.title.include?("Won't Believe")|| self.title.include?("Secret")||self.title.include?("Guess")||self.title.include?("Top")
        return true
      else
        errors.add(:title, "title must include clickbait-y terms")
      end
    end
  end
end
