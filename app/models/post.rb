class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

def is_clickbait?
  @clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
  if @clickbait.any?{ |c| self.title.to_s.include?(c) }
  else
    errors.add(:title, "This isn't clickbait")
  end
end

end
