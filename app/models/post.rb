class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?
  
    CLICKBAIT_PATTERNS = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]
  
    def is_clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end
    end
  end    
    
# class TitleValidator < ActiveModel::EachValidator
#     def validate_title(title)
#         unless title.include?( "Won't Believe" | "Secret" | "Top}" | "Guess" )
#             record.errors[:title] << (options[:message] || "is not a valid title")
#         end
#     end
# end

# class TitleValidator < ActiveModel::EachValidator
#     def validate_title(title)
#         unless title.include?( "Won't Believe" | "Secret" | "Top}" | "Guess" )
#             record.errors[:title] << (options[:message] || "is not a valid title")
#         end
#     end
# end

# class Post < ActiveRecord::Base
#     include ActiveModel::Validations
#     validates_with TitleValidator 
#     validates :title, validate_title
#     validates :title, presence: true
#     validates :summary, length: { maximum: 50 } 
#     validates :content, length: { minimum: 20 }
#     validates_inclusion_of :title, :in => %w( You Won't Believe Guess Top )
#     validates_inclusion_of :category, :in => %w( Fiction Non-Fiction )
# end
    # ??? WHAT OBJECT COULD I CALL ON? NO MATTER WHAT, I THINK I NEED TO COMBINE ALL OF THE ITEMS NEEDING VALIDATION IN THE TITLE_VALIDATOR INSTANCE METHOD
    # def title_validator
    #     binding.pry
    #     title.scan(/(Secret) | (Guess) | (Won't Believe) | (Top)\s[1-9] | (Top)\s[1-9][1-9]/)  
    #     if a == true
    #         @post.title
    #     end
    #     # |v| v =~ /[aeiou]/ }  #=> ["a", "e"]
        
#     # class Person < ActiveRecord::Base
#    include ActiveModel::Validations
#    validates_with NameValidator
# endend

    # class MyValidator < ActiveModel::Validator
    #     def validate(record)
    #       unless record.title.include?( "Won't Believe" | "Secret" | "Top [0-9]" | "Guess" )
    #         record.errors[:title] << 'Need a valid title'
    #       end
    #    end
    # end
       

    # class TitleValidator < ActiveModel::EachValidator
    #     def validate_each(title)
    #       unless title.include?( "Won't Believe" | "Secret" | "Top#{Integer}" | "Guess" )
    #         record.errors[:title] << (options[:message] || "is not a valid title")
    #       end
    #     end
    # end

    # class Post < ApplicationRecord
    #     validates :title, presence: true, title: true
    # end
