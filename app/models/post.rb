class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction) }

  validate :non_clickbait?


  def non_clickbait?
    clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]

    if !title.nil?
      clickbait_words.any? { |clickbait| title.include?(clickbait) }
    end
  end

end
