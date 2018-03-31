class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :title_is_clickbait

  def title_is_clickbait
    puts title
    unless self.title =~ /(Won't)|(Secret)|(Top \d)|(Guess)/
      errors.add(:title, "Needs to be clickbait")
    end
  end

end
