class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
  validate :title_is_sufficiently_click_baity

  def title_is_sufficiently_click_baity
    errors.add(:title, "isn't click bait-y enough") if !click_bait?(self.title) #maybe just (title) as argument
  end

  def click_bait?(title)
    cb = false
    # return false if title is nil
    return false if !title
    if title.match(/Top \d*/) || title.match(/Won't Believe/) || title.match(/Secret/) || title.match(/Guess/)
      cb = true
    end
    cb
  end

end
