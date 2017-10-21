class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w( Fiction Non-fiction)}
  validate :click_baity?


  def click_baity?
    click_bait = ["Won't Believe", "Secret", "Guess", "Top"]
    if !title.nil? && !click_bait.any?{ |bait| title.include?(bait) }
      errors.add(:title, "Must have a click baity title!")
    end
  end
end
