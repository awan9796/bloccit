require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }

  it { is_expected.to have_many(:posts)}
  it { is_expected.to have_many(:labelings) }
  it { is_expected.to have_many(:labels).through(:labelings) }

  it { is_expected.to have_many(:comments)}
  it { is_expected.to have_many(:commentings) }
  it { is_expected.to have_many(:comments).through(:commentings) }

  #it { should validate_length_of(:name).is_at_least(5) }
  #it { should validate_length_of(:description).is_at_least(15)}
  #it { should validate_presence_of(:name)}
  #it { should validate_presence_of(:description)}

  describe "attributes" do
    it "should respond to name" do
    expect(topic).to respond_to(:name)
    end

    it "should respond to description" do
    expect(topic).to respond_to(:description)
    end

    it "should respond to public" do
    expect(topic).to respond_to(:public)
    end

    it "should be public by default" do
    expect(topic.public).to be(true)
    end
  end
end
