require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  let(:new_advertisements) do
    Advertisement.create(
      id: 1,
      title: RandomData.random_sentence,
      copy: RandomData.random_paragraph,
      price: 25
    )
  end


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [new_advertisements] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([new_advertisements])
    end
  end


  describe "GET #show" do
    it "returns http success" do
      get :show, {id: new_advertisements.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: new_advertisements.id}
      expect(response).to render_template :show
    end

    it "assigns new_advertisements to @advertisement" do
      get :show, {id: new_advertisements.id}
      expect(assigns(:advertisement)).to eq(new_advertisements)
    end
  end


  describe "POST create" do
    it "increases the number of advertisements by 1" do
    expect{post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 25}}.to change(Advertisement,:count).by(1)
  end

  it "assigns the new advertisement to @advertisement" do
    post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 25}
    expect(assigns(:advertisement)).to eq Advertisement.last
  end

  it "redirects to the new advertisement" do
    post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 25}
    expect(response).to redirect_to Advertisement.last
  end
end
end
