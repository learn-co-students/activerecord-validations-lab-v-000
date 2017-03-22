class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) ,message: "%{value} is not a valid category" }

    validate do |post|
      ClickbaitValidator.new(post).validate
    end
end

class ClickbaitValidator
  def initialize(post)
    @post = post
  end

  def validate
    clickbaits = ["Won't Believe", "Secret", "Top 10", "Guess"]
    if @post.title
      if !clickbaits.any? { |clickbait| @post.title.include? clickbait }
          @post.errors[:base] << "This post is not a clickbait."
      end
    end
  end
end
