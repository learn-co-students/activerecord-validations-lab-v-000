class Post < ActiveRecord::Base
  validates :title, presence: true;
  validates :content, length: {minimum: 250};
  validates :summary, length: {maximum: 250};
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"] }

  validate :not_clickbait#, on: :create

  CLICKBAIT = ["Top [Number]", "Secret", "Guess", "Won't Believe"]

  def not_clickbait

    if title
      errors.add(:title, "is not valid") unless CLICKBAIT.any? {|item| title.include?(item)}
    end
  end

end
