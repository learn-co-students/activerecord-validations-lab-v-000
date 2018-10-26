class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { in: 250..Float::INFINITY }
  validates :summary, length: { in: 0..250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :instance_validations
  def instance_validations
    validates_with ClickbaitValidator
  end
end
