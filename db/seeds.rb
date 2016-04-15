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
unique_post = Post.find_or_create_by(title: "Ozzie-Apr14", body: "Ozzie is a big brown Rhodesian Ridgeback-Apr14")
puts "#{Post.count}"

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

Comment.find_or_create_by(body: "abcdehahfjiewufi jhfjha fhajfh", post: unique_post)
