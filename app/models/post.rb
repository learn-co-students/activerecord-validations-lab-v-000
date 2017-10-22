class MyValidator < ActiveModel::Validator
  def validate(post)
    unless post.title == nil || post.title.match(/Believe|Won't|Secret|Top[number]|Guess/)
      post.errors[:title] << 'Needs a clickbait-y title!'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates_with MyValidator
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%(value) is not a valid category"}
end
