class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, { :length => { :is => 250 } })
  validates :category, inclusion: { in: %w( Fiction Non-Fiction)}
  validates :summary, { :length => { :maximum => 250 } }

  validates :title, inclusion: { in: %w("Won't Believe" Secret Guess "Top [number]" )}, message: false
end
