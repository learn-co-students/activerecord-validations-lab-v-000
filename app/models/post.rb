class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :click_bait

  def click_bait
    if title && !title.match(/[Ww]on't [bB]elieve|[Ss]ecret|[Tt]op\s\d|[Gg]uess/)
      errors.add(:title, "must be click bait")
    end
  end


end
