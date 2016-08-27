require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :clickbaity

  def clickbaity
    if !(title == nil)
      unless title.match("(Won\'t Believe)|(Secret)|(Top [0-9])|(Guess)")
        errors.add(:title, "must be clickbaity")
      end
    end
  end
end
