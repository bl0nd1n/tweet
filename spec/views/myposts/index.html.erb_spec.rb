require 'spec_helper'

describe "myposts/index" do
  before(:each) do
    assign(:myposts, [
      stub_model(Mypost,
        :content => "Content",
        :user_id => 1,
        :image_url => "Image Url"
      ),
      stub_model(Mypost,
        :content => "Content",
        :user_id => 1,
        :image_url => "Image Url"
      )
    ])
  end

  it "renders a list of myposts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
  end
end
