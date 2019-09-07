class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true, length: { :minimum => 250 }
  validates :summary, presence: true, length: { :maximum => 250 }
  validates :category, presence: true, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait_in_title

  def clickbait_in_title
    @array = ["Secret", "Top ", "Guess", "Wont", "Believe"]
    unless title.nil?
      unless @array.any? {|i| title.split(" ").include?(i)}
        errors.add(:title, "doesn't include clickbait")
      end
      if title.split(" ").include?("Wont")
        unless title.split(" ").include?("Believe")
          errors.add(:title, "doesn't include clickbait")
        end
      end
    end
  end

end
