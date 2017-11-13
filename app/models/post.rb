class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  CATEGORY_OPTIONS = %w[Fiction Non-Fiction]
  CLICKBAIT_WORDS = [/(Won't\sBelieve)/, /(Secret)/, /(Top)\s\d+/, /(Guess)/]

  validates :category, inclusion: { in: CATEGORY_OPTIONS}
  validate :clickbait?


def clickbait?
  if !CLICKBAIT_WORDS.any? {|word| title =~ word }
    errors.add(:title, "title not clickbait-y")
  end
end

end
