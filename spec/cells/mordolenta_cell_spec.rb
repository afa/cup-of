require "spec_helper"

describe MordolentaCell do
 context "cell rendering" do
  context "rendering display" do
   before do
    @product = stub_model(Product, :cover_file_name=>'123.jpg')
   end
   subject { render_cell(:mordolenta, :display) }

   it "should show lent" do
    should have_xpath("//div[@class='mordoitems']" ) do | v |
     v.should have_xpath("li[@class='mordoitem']") do |im|
      im.should have_xpath("img[@src='#{@product.cover(:mord)}']")
     end
    end
   end
  end
 end
 context "cell instance" do
  subject {cell(:mordolenta)}
  it {should respond_to(:display)}
 end
end
