class Post < ActiveRecord::Base
  validator :Post, validates_with:
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 250}
  validates :summary, presence: true, length: { maximum: 250}
  validates :category, inclusion: {in: %w(Ficture  Non-Fiction)}

end
# Post category is either Fiction or Non-Fiction This step requires
# an inclusion validator, which was not outlined in the README lesson. You'll need to
# refer to the Rails guide to look up how to use it.
