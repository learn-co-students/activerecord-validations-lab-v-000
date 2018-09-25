class Post < ActiveRecord::Base
  # include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250 }
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  # validates_with MyValidator
end
#
# class MyValidator < ActiveModel::Validator
#   def validate(post)
#     unless post.title.starts_with?("Won't Believe", "Secret", "Top", "Guess")
#       record.errors[:title] << 'Need a clickbait-y title please!'
#     end
#   end
# end
