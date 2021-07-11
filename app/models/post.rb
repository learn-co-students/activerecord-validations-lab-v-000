class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 25}
  validates :summary, length: { maximum: 10}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity?

 def clickbaity?
   cliche_words = [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]

   if !cliche_words.detect { |w| w.match title }
     errors.add(:title, "Title must contain 'Won't Believe', 'Secret', 'Top
     [number]', or 'Guess'")
   end
  end

end
