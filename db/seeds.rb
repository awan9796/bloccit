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

Post.find_or_create_by(title: "My thoughts on Ruby", body: "Love it and Hate it at the same time...")
Comment.find_or_create_by(body: "One unique comment")


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
