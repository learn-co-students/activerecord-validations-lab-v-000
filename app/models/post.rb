class Post < ActiveRecord::Base

  validates :title, presence: true
  validate :title_is_valid
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}


  private

  def title_is_valid
    if self.title && !title.match(/(Won't Believe)|(Secret)|(Top\d+)|(Guess)/)
      errors.add(:title, "Title is not valid")
    end
  end

end
