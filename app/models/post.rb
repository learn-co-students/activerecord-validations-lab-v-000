class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :title, presence: true, if: :click_baity?

  def click_baity?
    if title != nil
      if title.match(/Won't Believe|Secret|Top \d|Guess/)
        true
      else
        errors.add(:title, "not clickbaity enough")
      end
    else
      errors.add(:title, "not clickbaity enough")
    end
  end
end
