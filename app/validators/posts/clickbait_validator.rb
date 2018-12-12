# class ClickbaitValidator < ActiveModel::Validator
#     def validate(record)
#         record.title.split.any? do |word|
#             word.include? "Won't Believe"
#             word.include? "Secret"
#             word.include? "Guess" 
#             word.include? "Top"
#         end        
#     end
# end