class ClickBaitValidator < ActiveModel::Validator
  def validate(record)
		if record.title
			unless record.title.index(/Won't Believe/) || record.title.index(/Secret/) || record.title.index(/Guess/) || record.title.index(/Top \d/)
				record.errors[:title] << 'The title is not ClickBait!' 
			end
		else
			record.errors[:title] << 'The title is not ClickBait!' 
		end
	end
end
