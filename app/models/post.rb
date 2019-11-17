class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 50 }
  validates :category, inclusion: { in: %w(Fiction) }
  validate  :title_clickbait

  private

  def title_clickbait
    if title && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Guess") && !title.include?("Top")
      errors[:base] << "title cannot be #{title}"
    end
  end

end
