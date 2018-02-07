class MyValidator < ActiveModel::Validator

  KEY_PHRASES = ["Won't Believe", "Secret", "Top", "Guess"]

  def validate(post)
    clickbait = false
    KEY_PHRASES.each do |keyphrase|
      if post.title && post.title.include?(keyphrase)
        clickbait = true
      end
    end
    post.errors[:title] << 'Make the title clickbait-y' unless clickbait
  end
end

class Post < ActiveRecord::Base

  include ActiveModel::Validations
  validates_with MyValidator

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

end
