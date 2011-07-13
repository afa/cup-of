require 'spec_helper'

describe Admin::MainController do
 context "with user" do
  before do
   @request.env["devise.mapping"] = Devise.mappings[:user]
   sign_in user
   get :index
  end
  context "when admin" do
   let(:user) {FactoryGirl.create(:user, :username => 'kat')}
   subject{response}
   it {should be_success}
  end
  context "when non-admin" do
   let(:user) {FactoryGirl.create(:user)}
   subject{response}
   it {should redirect_to(root_path)}
  end
 end
 context "when anonymous" do
  it "should forbid" do
   get :index
   response.should redirect_to(root_path)
  end
 end
end
