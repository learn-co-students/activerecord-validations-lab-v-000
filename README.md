# ActiveRecord Validations Lab

# Basic Validations

Add validations to these models such that...

1. All authors have a name
1. No two authors have the same name
1. Author phone numbers are exactly ten digits
1. All posts have a title
1. Post content is at least 250 characters long
1. Post summary is a maximum of 250 characters
1. Post category is either `Fiction` or `Non-Fiction`
   This step requires an `inclusion` validator, which was not outlined in the
   README lesson. You'll need to refer to the [Rails guide][ar_validations] to
   look up how to use it.
   [ar_validations]: http://guides.rubyonrails.org/active_record_validations.html


# Custom Validations

Finally, add a custom validator to `Post` that ensures the title is sufficiently
clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top
[number]", or "Guess", the validator should return false.

For future projects, it's a good idea to skim the list of available validation options.
It will give you a sense of what's available and help with creating
validations for your own model objects.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/activerecord-validations-lab'>ActiveRecord Validations Lab</a> on Learn.co and start learning to code for free.</p>

regex quick reference
http://www.zenspider.com/ruby/quickref.html#types

regex tutorial:
http://ruby.bastardsbook.com/chapters/regexes/

interactive regex builder at gskinner.com
https://regexr.com/

irb for checkbait

Last login: Mon Sep 25 20:01:08 on console
[20:46:55] ~ $ irb
2.4.0 :001 >   CLICKBAIT_PATTERNS = [
2.4.0 :002 >       /Won't Believe/i,
2.4.0 :003 >       /Secret/i,
2.4.0 :004 >       /Top [0-9]*/i,
2.4.0 :005 >       /Guess/i
2.4.0 :006?>   ]
 => [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
2.4.0 :007 > CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
NameError: undefined local variable or method `title' for main:Object
	from (irb):7:in `block in irb_binding'
	from (irb):7:in `each'
	from (irb):7:in `none?'
	from (irb):7
	from /Users/charlielee/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :008 > title="must be clickbait"
 => "must be clickbait"
2.4.0 :009 > title
 => "must be clickbait"
2.4.0 :010 > CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
 => true
2.4.0 :011 > CLICKBAIT_PATTERNS.none?
 => false
2.4.0 :012 > { |pat| pat.match title }
2.4.0 :013 > /Won't Believe/i = pat
2.4.0 :014 > pat = /Won't Believe/i
 => /Won't Believe/i
2.4.0 :015 > pat.match title
 => nil
2.4.0 :016 > pat.match == title
ArgumentError: wrong number of arguments (given 0, expected 1..2)
	from (irb):16:in `match'
	from (irb):16
	from /Users/charlielee/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :017 > pat.match == title?
ArgumentError: wrong number of arguments (given 0, expected 1..2)
	from (irb):17:in `match'
	from (irb):17
	from /Users/charlielee/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :018 > pat.match? title
 => false
2.4.0 :019 > pat = /Secret/i
 => /Secret/i
2.4.0 :020 > pat.match? title
 => false
2.4.0 :021 > pat = /Top [0-9]*/i
 => /Top [0-9]*/i
2.4.0 :022 > pat.match? title
 => false
2.4.0 :023 > pat = /Guess/i
 => /Guess/i
2.4.0 :024 > pat.match? title
 => false
2.4.0 :025 >
