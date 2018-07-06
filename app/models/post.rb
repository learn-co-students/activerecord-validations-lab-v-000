class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimun: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {:in => ['Fiction', 'Non-Fiction']}
  include ActiveModel::Validations
  validates_with PostValidator
end
