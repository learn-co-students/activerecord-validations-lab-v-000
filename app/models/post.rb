class Post < ActiveRecord::Base
  #include ActiveModel::Validations
  #validates_with ClickbaitValidator
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbaity?

  def clickbaity?
    #binding.pry
    if self.title
      errors.add(:title, "must be clickbait-y") unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess") || title.include?("Top [0-9]")
    end
  end
end
