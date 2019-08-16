class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Nonfiction)}
  validate :post_must_be_clickbait


  def post_must_be_clickbait
    clickbait = [ /Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/ ]
    if clickbait.none? {|bait| bait.match title}
      errors.add(:title, "title must be clickbait")
    end
  end
end
