include RandomData

50.times do

  Post.create!(

    title:  RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(

    post: posts.sample,
    body: RandomData.random_paragraph
  )
end



puts "#{Post.count}"
Post.find_or_create_by(title: "Ozzie-REV.2", body: "Ozzie is a big brown Rhodesian Ridgeback-REV.2")
puts "#{Post.count}"

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

Comment.find_or_create_by(title: "Ozzie-REV.2", body: "Ozzie sleeps all day like a cat - REV.2")
