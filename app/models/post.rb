class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_is_clickbaity


    def title_is_clickbaity
      false unless !title.nil? && title.include?("Won't Believe" || "Secret" || /Top \d+/ || "Guess")
    end
end
