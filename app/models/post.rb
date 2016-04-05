class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  #validates :title, inclusion: { in: %w(/(Won't Believe)|(Secret)|(Guess)|(Top\s\d)/) }
  validate :clickbait

  def clickbait
    if !["Won't Believe","Secret","Guess","Top[/d]"].any? { |phrase| self.title.to_s.include?(phrase) }
      errors.add(:name, "please include a clickbait-y title")
    end
  end
end
