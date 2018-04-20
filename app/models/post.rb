class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :but_is_it_clickbait

  def but_is_it_clickbait
    if self.title
      if ["won't believe", "secret", "Top #{/\d/}", "guess"].any? { |clickbait| self.title.downcase.include?(clickbait) } == false
        errors.add(:title, "Gotta have that clickbait, bruh")
      end
    end
  end
end
