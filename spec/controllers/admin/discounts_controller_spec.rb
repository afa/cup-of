require 'spec_helper'

describe Admin::DiscountsController do
 let(:discount) {FactoryGirl.create(:discount)}
 context "with user" do
  before do
   @request.env["devise.mapping"] = Devise.mappings[:user]
   sign_in user
  end
  let(:user) {FactoryGirl.create(:user, :username => 'kat')}

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :id => discount.id
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit', :id => discount.id
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    it "should be successful" do
      put 'update', :id => discount.id
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      post 'create'
      response.should be_success
    end
  end
 end
 context "when anonimous" do
  let(:user) {FactoryGirl.create(:user)}
  it "should redirect on get index" do
   get :index
   response.should redirect_to(root_path)
  end

  it "should redirect on get show" do
   get :show, :id => discount.id
   response.should redirect_to(root_path)
  end

  it "should redirect on get new" do
   get :new
   response.should redirect_to(root_path)
  end

  it "should redirect on get edit" do
   get :edit, :id => discount.id
   response.should redirect_to(root_path)
  end

  it "should redirect on post create" do
   post :create, :id => discount.id
   response.should redirect_to(root_path)
  end

  it "should redirect on put update" do
   put :update, :id => discount.id
   response.should redirect_to(root_path)
  end

 end

end
