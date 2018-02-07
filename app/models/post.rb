class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.title =~ /(Won't Believe|Secret|Top \d|Guess)/
      record.errors[:title] << 'Needs clickbait-y words.'
    end
  end
end


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, { :length => { :minimum => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
  validates :category, inclusion: { in: %w(Fiction Nonfiction)}
  validates_with TitleValidator
end
