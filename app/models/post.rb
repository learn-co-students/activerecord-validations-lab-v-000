class Post < ActiveRecord::Base
  validates_presence_of :title, presence: true
  validate :title_clickbait
  validates(:content, { :length => { :minimum => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

  def title_clickbait
    if title
      clickbait = ["Won't Believe", "Secret", "Top[number]", "Guess"]
      if !clickbait.any? { |str| title.include?(str) }
        errors.add(:title, 'title is not clickbait-y')
      end
    end
  end

end
