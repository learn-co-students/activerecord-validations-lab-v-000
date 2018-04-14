class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :clickbaity

  def clickbaity
    unless title && (title.include?("Won't Believe") || title.include?('Secret') || title.match(/top \d/) || title.include?('Guess'))
      errors.add(:title, 'is not clickbaity')
    end
  end
end
