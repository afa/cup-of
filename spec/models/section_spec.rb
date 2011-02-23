require 'spec_helper'

describe Section do
 before do
  @root1 = Factory(:section)
  @root2 = Factory(:section)
  Factory(:section, :parent_id => @root1.id)
  Factory(:product, :section_id => @root1.id)
  Factory(:product, :section_id => @root2.id)
  Factory(:product, :section_id => @root1.children.first.id)
 end
 
 context "for all_products" do
  it "should have valid count of product" do
   @root1.all_products.size.should == 2
   @root2.all_products.size.should == 1
  end

  it "should read product from tree identicaly" do
   @root1.all_products.should == @root1.slow_all_products
   @root2.all_products.should == @root2.slow_all_products
  end
 end

 context "for tree_to_list" do
  it "should expand all children to array with current section included" do
   @root1.tree_to_list.size.should == 2
   @root1.tree_to_list.should be_include(@root1)
   @root2.tree_to_list.size.should == 1
  end
 end
end
