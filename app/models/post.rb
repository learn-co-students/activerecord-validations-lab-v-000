class Post < ActiveRecord::Base
  include ActiveModel::Validations
  # validate that title is filled out
  # validate that content is at least 250 characters long
  # Validate the summary is a maximum of 250 characters long
  # Need an inclusion validator to ensure the category is either FICTION or NONFICTION
  # Add a custom validator for the title. See lesson for deets.
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with TitleValidator

end
