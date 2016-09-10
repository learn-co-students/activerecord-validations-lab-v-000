class Post < ActiveRecord::Base
  validates :title, presence: true, exclusion: { in: %w(Won't Believe, Secret, Top [number], Guess) }
  validates :content, presence: true, length: { minimum: 250 }
  validates :summary, presence: true, length: { maximum: 250 }
  validates :category, presence: true, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :non_clickbait

  def non_clickbait
    if !title.nil? && (!title.include?("Won't Believe" || "Secret" || "Top" || "Guess"))
      errors.add(:nonclick_bait, "Sorry, title is too clickbait-y.")
    end
  end
end
