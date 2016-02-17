require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CommentsHelper. For example:
#
# describe CommentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CommentsHelper, type: :helper do
  describe "comments_to_buttons" do
     it "turns comments into HTML buttons" do
       C1 = Comment.create!(body: "C1")
       C2 = Comment.create!(body: "C2")
       expected_html = '<a class="btn-xs btn-primary" href="/comments/1">L1</a> <a class="btn-xs btn-primary" href="/comments/2">L2</a>'

       expect(comments_to_buttons([C1, C2])).to eq expected_html
     end
   end
end
