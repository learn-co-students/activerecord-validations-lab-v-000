class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, { :length => { :minimum => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :click_bait

  def click_bait
    if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
       errors.add(:title, "not clickbait")
    end if title.present?
  end


end
