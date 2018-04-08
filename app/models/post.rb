class TitleValidator < ActiveModel::Validator
  def validate(post)
    unless post.title.to_s.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      post.errors.add(:title, "Needs a clickbait title")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates_inclusion_of :category, :in => %w(Fiction Non-Fiction)
  validates_with TitleValidator


end
