require 'rails_helper'
require RandomData

RSpec.describe SponsoredPost, type: :model do
  let(:title) { RandomData.random_sentence }
  let (:body) { RandomData.random_paragraph }
  let (:price) { 25 }

  let (:topic) {Topic.create!(title: title, body: body)}
  let (:sponsored_post) {topic.sponsored_posts.create!(title: title, body: body, price: price)}

  it { is_expected.to belong_to(:topic)}


  describe "attributes" do
    it "has a title, body, and price attribute" do
      expect(sponsored_post).to have_attributes(title: title, body: body, price: price)
    end
  end
end
