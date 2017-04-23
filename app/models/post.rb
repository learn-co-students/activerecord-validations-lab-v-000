class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { :minimum => 250}
  validates :summary, length: { :maximum => 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait_title

  private

  def clickbait_title
    if title
      errors.add(:title, 'No clickbait') if !(title.match /Secret|Guess|Won't Believe/)
    end
  end
end
