class Post < ActiveRecord::Base

  validate :title_must_be_clickbait

  def title_must_be_clickbait
#  binding.pry

    if !title.to_s.include?("Won't Believe"|| "Secret"|| "Top [number]" || "Guess")
      errors.add(:title, "must be click bait-y!")
    end
  end


  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Nonfiction)}

end
