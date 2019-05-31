class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 250}
  validates :summary, presence: true, length: {maximum: 250}
  validates :category, presence: true, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  private

  def clickbait(post)
    CLICKBAIT_PATTERNS = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i] 
    CLICKBAIT_PATTERNS.each do |i|
      unless post.title.match(i)
        post.errors[:title] << "You need a more click-baity title!"
      end
    end
  end

end
