require_relative "../helpers/posts_helper.rb"
class Post < ActiveRecord::Base
  include ActiveRecord::Validations
  include PostsHelper
  validates_with TitleValidator
  validates :content, presence: true, length: {minimum: 250}
  validates :summary, presence: true, length: {maximum: 250}
  validates :category, presence: true, inclusion: { in: ['Fiction', 'Non-Fiction']}
end
