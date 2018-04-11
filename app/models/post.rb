class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :title, format: { with: %r(([\s\S]*(Guess | Secret | Won't Believe | Top [0-9])[\s\S]*)) }
  validates :content, { length: { minimum: 250 } }
  validates :summary, { length: { maximum: 250 } }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
