class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 30 }

  validate :category_must_be_in_choices
  validate :not_click_bait


  def category_must_be_in_choices
    if category != "Fiction"
      errors.add(:category, "Must be fiction")
    end
  end

  def not_click_bait
    if title == "True Facts"
      errors.add(:title, "Stop baiting people!")
    end
  end
end
