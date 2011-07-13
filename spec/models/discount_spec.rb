require 'spec_helper'

describe Discount do
  context "for active_for_time" do
   before do
    @discount = FactoryGirl.create(:discount)
    @old_discount = FactoryGirl.create(:discount, :stop_at => 1.hour.ago)
    @future_discount = FactoryGirl.create(:discount, :start_at => 1.hour.from_now)
   end
   it "should be active only valid discount" do
    Discount.active_now.all.should include(@discount)
    Discount.active_now.all.should_not include(@future_discount)
    Discount.active_now.all.should_not include(@old_discount)
   end
  end
  context "for active_for_user and active_without_user" do
   before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @discount = FactoryGirl.create(:discount)
    @nm_discount = FactoryGirl.create(:discount)
    @nu_discount = FactoryGirl.create(:discount)
    @old_discount = FactoryGirl.create(:discount, :stop_at => 1.hour.ago)
    @user.discounts << @discount << @old_discount
    #@user.save
    @user2.discounts << @nm_discount
    #@user2.save
   end
   it "should get valid user discount" do
    #with unuser discounts?
    Discount.active_now.for_user(@user).should have(1).items
    Discount.active_now.for_user(@user).should include(@discount)
    Discount.active_now.for_user(@user).should_not include(@nu_discount)
    Discount.active_now.for_user(@user).should_not include(@old_discount)
   end
   it "should return unuser discount" do
    Discount.active_now.without_user.should have(1).items
    Discount.active_now.without_user.should include(@nu_discount)
   end
  end
  context "for active_for_product" do
   context "where product has discount" do
    before do
     @discount = FactoryGirl.create(:discount)
     @s_discount = FactoryGirl.create(:discount)
     @p_discount = FactoryGirl.create(:discount)
     @p_section = FactoryGirl.create(:section)
     @section = FactoryGirl.create(:section, :parent_id => @p_section.id)
     @section.discounts << @s_discount
     @p_section.discounts << @p_discount
     @product = FactoryGirl.create(:product, :section_id => @section.id)
     @product.discounts << @discount
    end
    it "should return valid discount" do
     Discount.active_now.for_product(@product).should have(3).items
     Discount.active_now.for_product(@product).should include(@discount)
     Discount.active_now.for_product(@product).should include(@s_discount)
     Discount.active_now.for_product(@product).should include(@p_discount)
    end
   end
   context "where product section has discount" do
    before do
     @s_discount = FactoryGirl.create(:discount)
     @p_discount = FactoryGirl.create(:discount)
     @p_section = FactoryGirl.create(:section)
     @section = FactoryGirl.create(:section, :parent_id => @p_section.id)
     #@section.discounts << @s_discount
     @p_section.discounts << @p_discount
    end
    it "should return valid discount" do
     Discount.active_now.for_section(@p_section).should have(1).items
     Discount.active_now.for_section(@p_section).should include(@p_discount)
    end
    context "where product section parent has discount" do
     it "should return valid discount" do
      Discount.active_now.for_section(@section).should have(1).items
      Discount.active_now.for_section(@section).should include(@p_discount)
     end
    end
   end
   context "for current" do
    before do
     @user = FactoryGirl.create(:user)
     @discount = FactoryGirl.create(:discount)
     @u_discount = FactoryGirl.create(:discount)
     @up_discount = FactoryGirl.create(:discount)
     @s_discount = FactoryGirl.create(:discount)
     @p_discount = FactoryGirl.create(:discount)
     @p_section = FactoryGirl.create(:section)
     @section = FactoryGirl.create(:section, :parent_id => @p_section.id)
     @section.discounts << @s_discount
     @product = FactoryGirl.create(:product, :section_id => @section.id)
     @product.discounts << @discount << @up_discount
     @p_section.discounts << @p_discount
     @user.discounts << @u_discount << @up_discount
    end
    context "when user known" do
     it "should return discounts" do
      Discount.current(@product, @user).should have(2).items
      Discount.current(@product, @user).should include(@up_discount)
     end
    end
   end
  end
  
end
