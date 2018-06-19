class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait
  def click_bait
    baits = ['Won\'t Believe', 'Secret', 'Top', 'Guess']
    test = baits.any? {|bait| title.include?(bait) if title}
    unless test
      errors.add(:bait_status, 'Doesn\'t include bait')
    end
  end
end
