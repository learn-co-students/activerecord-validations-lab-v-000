class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: (fiction non-fiction)}

  def validate(post)
    unless post.title.includes? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
      return false
    end
  end
end
