class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate  :title_must_be_click_baity

  def title_must_be_click_baity
    if !title || !(title.include?("Guess") || title.include?("Secret") || title.match(/TOP[0-9]+/) || title.include?("Won't Believe"))
      errors.add(:title, "is not click baity enough")
    end
  end
end
