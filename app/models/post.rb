

class Post < ActiveRecord::Base


  validates :title, presence: true
  validates :content, { :length => { :minimum => 250 } }
  validates :summary, { :length => { :maximum => 250 } }

  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }

  validate :title_keywords

  private

  def title_keywords
    if !title.nil?
      keywords = ["Won't Believe", "sSecret", "Top
  [number]", "Guess"]
      if !keywords.any? {|keyword| title.include? keyword}
        errors.add(:title, "must contain keywords")
      end
    end
  end
end
