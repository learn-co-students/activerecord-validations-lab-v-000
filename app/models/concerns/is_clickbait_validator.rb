# class IsClickbaitValidator < ActiveModel::Validator
#   #validates :title, exclusion: { in: %w("Won't Believe" "Secret" "Top [number]" "Guess")}
#
#   def validate(record)
#
#     if !CLICKBAIT_ARRAY.detect {|clickbait_elem| record.title.include? clickbait_elem}
#       record.errors.add(:title, "is not clickbait-y")
#     end
#   end
# end
