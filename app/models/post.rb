class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :must_be_clickbait


  def must_be_clickbait
     unless check_titles(clickbait_strings)
       errors.add(:title, "Definitely not enough clickbait here.")
     end
  end

  private

  def check_titles(array)
    array.any? do |string|
      check_title(string)
    end
  end

  def check_title(string)
    title && title.match(string)
  end

  def clickbait_strings
    ["Won't Believe", "Secret", "Top [0-9]", "Guess"]
  end

end
