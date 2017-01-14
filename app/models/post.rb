class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_non_clickbait

  def title_non_clickbait
    if title.nil?
      false
    else
      if title.scan(/Won't Believe/) == []
        errors.add(:title, "This title isn't clickbaity")
      end
    end
  end

end
