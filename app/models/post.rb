class Post < ActiveRecord::Base
  # include ActiveModel::Validations
  #
  # validates_with MyValidator
  validates :title, presence: true
  validates :content, length: { minimum: 50 }
  validates :summary, length: { maximum: 30 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :title, inclusion: { in: ["Won't Believe", "Secret", "Top [number]", "Guess", "You Won't Believe These True Facts"] }
  # format: { with: /["Won't Believe", "Secret", "Top [number]", "Guess"]/, message: "must contain clickbait" }
  # validates :non_clickbait, inclusion: { in: %w(Won't Believe Secret Top [number] Guess)}
  # validate :clickbait




  # def is_clickbait?
  #   post.title.include?("Won't Believe") ||
  #   post.title.include?("Secret") ||
  #   post.title.include?("Top [number]") ||
  #   post.title.include?("Guess")
  # end
end
