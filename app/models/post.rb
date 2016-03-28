class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content,  length: { minimum: 250 }
  validates :summary,  length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :clickbait

  def clickbait
    if !self.title || !self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      self.errors[:title] << 'Post is not clickbait-y enough'
    end
  end

end
