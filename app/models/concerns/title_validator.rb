class TitleValidator < ActiveModel::Validator
  def validate(record)
  	if record.title
	    unless %w(Won't Believe Secret Top Guess).any? { |s| record.title.include? s }
	      record.errors[:title] << 'Need a clickbaity title!'
	    end
    end
  end
end