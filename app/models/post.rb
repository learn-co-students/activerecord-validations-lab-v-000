class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :check_clickbait

  def check_clickbait
    if !title.nil? && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Guess") && !title.include?("Top")
      errors.add(:title, "The title isn't clickbaity")
    end
  end

end
