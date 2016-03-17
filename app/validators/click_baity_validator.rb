class ClickBaityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
# binding.pry

    unless !!value && value.match(/([Ww]on\'t Believe|[Tt]op\s[0-9]|[Gg]uess|[Ss]ecret)/)
      record.errors[:title] << "Not clickbaity enough"
    end
  end
end