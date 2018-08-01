class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title != nil
      clickbait = ["Won't Believe", "Secret", "Top #{/\d/}", "Guess"]
      unless clickbait.any? {|bait| record.title.include?(bait) }
        record.errors[:title] << 'Title must be present and have clickbait!'
      end
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with TitleValidator

end
