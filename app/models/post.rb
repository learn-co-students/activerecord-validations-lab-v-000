class Post < ActiveRecord::Base
validates :title, presence: true
validates :content, length: { minimum: 250 }
validates :summary, length: { maximum: 250 }
validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
validate :validate, on: :create

  def validate
    if /(Won't Believe)|(Secret)|(Guess)|((Top) *[0-9])/.match(self.title) == nil
      errors.add(:title)
    end
  end


end
