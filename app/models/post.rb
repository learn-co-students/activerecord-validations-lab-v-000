class Post < ActiveRecord::Base
  validates :title, presence: true
  include ActiveModel::Validations
  validates_with TitleValidator
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


end
