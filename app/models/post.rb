class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { :minimum => 200 }
  validates :summary, length: { :maximum => 200 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :is_clickbait

  def is_clickbait
    if title != nil
      if ((!title.include? ("Won't Believe")) && (!title.include? ("Secret")) && (!title.include? ( "Top [number]")) && (!title.include? ("Guess")))
        errors.add(:title, "WRONG")
      end
    end
  end
end
