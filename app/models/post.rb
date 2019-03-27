class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :title, :title_is_clickbait
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  def title_is_clickbait

   if title && ["Won't Believe", "Secret", "Top", "Guess"].all? {|phrase| title.exclude?(phrase)}
     errors.add(:title, "not clickbaity enough")
   end

  end

end
