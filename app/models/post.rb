class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 250}
  validates :summary, presence: true, length: {maximum: 250}
  validates :category, presence: true, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait


private

  def clickbait
    clickbait_patterns = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
      if clickbait_patterns.none? do |i|
        i.match(title)
      end
          self.errors[:title] << "You need a more click-baity title!"
      end
    end

  end
