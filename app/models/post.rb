class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbate

  def clickbate
   title_options = /Won't Believe|Secret|Top[0-9]|Guess/i
   if self.title.scan(title_options).length < 1
    errors.add(:title, "This title must contain some clickbate!")
   end if self.title
  end
end
