class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    return false if title == nil
    unless ["Won't Believe", "Secret", "Guess"].any? {|cb| title.match(cb)} || self.title.match(/Top \d*/)
      errors.add(:title, "not clickbait")
    end
  end
end
