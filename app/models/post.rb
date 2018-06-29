class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  def is_clickbait?
    unless self.title.nil?
      if !self.title.match(/Won't Believe|Secret|Guess|Top [0123456789]+/)
        errors.add(:title, "No one will ever click this!")
      end
    end
  end


end
