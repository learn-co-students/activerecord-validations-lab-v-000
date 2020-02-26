class Validator < ActiveModel::Validator
    def validate(record)
        if record.title != nil
            unless record.title.match?(/(You|Won't Believe|Secret|Top \d|Guess)/)
                record.errors[:title] << 'Need a clickbait title please!'
            end
        end
    end
end