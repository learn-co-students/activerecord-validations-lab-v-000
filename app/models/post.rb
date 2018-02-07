class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :valid_title?

CB = [/Won't Believe/i, /Secret/, /Guess/, /Top [0-100]/i ]
  
  private 

  def valid_title?
    if CB.none? { |click| click.match title}
      errors.add(:title, "This is not a clickbait title.")
    end
  end

end
