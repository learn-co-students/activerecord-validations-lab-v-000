class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  #validates :title, exclusion: { in: %w(Won't Believe Guess Top Secret) }

  validate :title_in_list

  #binding.pry

  private

  def title_in_list
    binding.pry
    if self.title == nil
      false
    elsif self.title.include? "Won't Believe"
      #binding.pry
       #errors.add(:title, “error”)
       true
    else
      #binding.pry
      true
      #errors.add(:title, “error”)
    end
  end

end
