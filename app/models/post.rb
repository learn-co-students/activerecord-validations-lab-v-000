class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, { :length => { :minimum => 250 } }
  validates :summary, { :length => { :maximum => 250 } }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :post_title_must_be_clickbaity

  private

  def post_title_must_be_clickbaity
    if !/Won't Believe|Secret|Top\s\d|Guess/.match(self.title)
      errors.add(:title, 'has to be clickbaity')
   end
  end

end
