class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait

  def click_bait
    if title != nil && !title.include?("Won't Believe" || "Secret" || "Top
[/\d+/]" || "Guess")
    errors.add(:title, "not click-baity")
    end
  end
end
