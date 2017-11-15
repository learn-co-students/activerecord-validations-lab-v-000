class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_is_clickbait

  CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]

  def title_is_clickbait

    unless title == nil
      if CLICKBAIT.none? {|word| title.include?(word)}
         errors[:title] << "Title must contain clickbait."
      end
    end
  end


end
