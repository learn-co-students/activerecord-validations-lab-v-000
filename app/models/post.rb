class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    if !(/won't believe|secret|guess/i).match title #/i is for case-sensitive matching
      errors.add(:title, "clickbait")
    end
  end

end
