class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait

  private

  def click_bait
    if self.title != nil
      unless
        (self.title.include?("Won't Believe")) || (self.title.include?("Secret")) || (self.title.include?("Top")) || (self.title.include?("Guess"))
        self.errors[:title] << "Edit the title to make it click-baity!"
      end
    end
  end

end
