class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :clickbait


  def clickbait
    regex = /won\'t|believe|secret|top|guess/i/g
    regex.match?(title) =! nil
  end
end
