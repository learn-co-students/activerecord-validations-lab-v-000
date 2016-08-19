class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  #validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :is_clickbait?

  @@clickbait_arr = ["Won't Believe", "Secret", "Top 10", "Guess"]

  def is_clickbait?

    if !title.nil? && !@@clickbait_arr.any? {|bait| title.include?(bait)}   #!title.include?("Won't Believe" || "Secret" || "Top 10"|| "Guess")
      errors.add(:title, "This isn't click bait!")
    end
  end
end
