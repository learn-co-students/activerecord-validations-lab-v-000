class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
  validate :click_bait

  def click_bait
    acceptable = [/Won't Believe/, /Secret/, /Top \d+/, /Guess/]
    unless acceptable.any? {|cb| title.index(cb) if title}
      errors.add(:click_bait, "Needs more click bait")
    end
  end

end
