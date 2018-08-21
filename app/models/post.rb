class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :validate_title
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}

  def validate_title
    the_title = self.title.to_s
    if the_title.include?("Won't Believe") || the_title.include?("Secret") || the_title.include?("Top") || the_title.include?("Guess")
    else
      errors.add(:title, "invalid")
    end
  end

end
