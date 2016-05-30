require 'rails_helper'

 RSpec.describe Comment, type: :model do
   let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
   let(:comment) { Comment.create!(body: 'Comment Body', user: user) }

   #it { is_expected.to belong_to(:post) }
   it { is_expected.to belong_to(:user) }
   it { is_expected.to validate_presence_of(:body) }
   it { is_expected.to validate_length_of(:body).is_at_least(5) }

   it { is_expected.to have_many :commentings }
   it { is_expected.to have_many(:topics).through(:commentings) }
   it { is_expected.to have_many(:posts).through(:commentings)}


   describe "commentings" do
     it "allows the same comment to be associated with a different topic and post" do

      topic.comments << comment
      post.comments << comment

      topic_comment = topic.comments[0]
      post_comment = post.comments[0]

      expect(topic_comment).to eql(post_comment)
   end
 end



   #describe "attributes" do
       #it "responds to body" do
         #expect(comment).to respond_to(:body)
       #end
     #end

     #describe "after_create" do

       #before do
       #@another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
     #end


     #it "sends an email to users who have favourited the post" do
       #favourite = user.favourites.create(post: post)
       #expect(FavouriteMailer).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))

       #@another_comment.save
     #end


     #it "does not send emails to users who haven't favourited the post" do
       #expect(FavouriteMailer).not_to receive(:new_comment)

       #@another_comment.save
     #end
   #end
   end
