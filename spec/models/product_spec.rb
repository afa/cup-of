require 'spec_helper'

describe Product do
 context "for price" do
  before do
   @user = Factory(:user)
   @section = Factory(:section)
   @product = Factory(:product, :section_id => @section.id, :price => 2)
  end
  context "with discount for user" do
   before do
    @u_discount = Factory(:discount, :multiplier => 0.5)
    @user.discounts << @u_discount
    @product.discounts << @u_discount
   end
   it "should apply discount" do
    @product.current_price(@user).should == (@product.price / 2)
   end
  end
 end
end
