require_relative 'concerns/custom_validations'

class Post < ActiveRecord::Base
  validates :title, presence: true, clickbait: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction","Non-Fiction"]}
end
