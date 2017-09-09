class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, { :length => {:minimum => 250}}
  validates :summary, { :length => {:maximum => 250}}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait?

  ClickBait = [/Won't Believe/i, /Secret/, /Guess/, /Top [0-100]/i]


  def click_bait?
    if ClickBait.none? {|click| click.match title}
      errors.add(:title, "Not Clickbait enough")
    end
  end

end
