require 'pry'
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, { :length => { minimum: 250 } }
    validates :summary, { :length => { maximum: 250 } }
    validates :category, inclusion: ['Fiction', 'Non-Fiction']
    validate :is_clickbait?
    # def is_clickbait?
    #   if self.title
    #     found = ["Won't Believe", "Secret", "Top ", "Guess"].any? { |click|
    #           self.title.include?(click)
    #     }
    #     if !found
    #       errors.add(:title,"Not clickbait-y")
    #     end
    #   end
    # end
    # Better solution
    CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "Not clickbait-y")
    end
  end
end
