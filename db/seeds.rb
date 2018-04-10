# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create([{content: "This is a test", title: "Test 1", summary: "A simple test", category: "Non-Fiction"},
            {content: "What is it all with you?", title: "Palleys vs Yews", summary: "What's it all about?", category: "Fiction"},
            {content: "I know it's hard, but you'll see it was the only way.", title: "Believe it or not", summary: "Yeorham", category: "Non-Fiction"}
           ])

Author.create([{name: "Kosher Activity", phone_number: 5550322345}, {name: "No name", phone_number:9172839482}])
