class Post < ActiveRecord::Base
  validates :title, presence: true, format: { with: /.*(Guess).*|.*(Secret).*|.*(Won't Believe).*|.*(Top )\d.*/}

  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
