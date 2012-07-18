require 'spec_helper'

describe "myposts/show" do
  before(:each) do
    @mypost = assign(:mypost, stub_model(Mypost,
      :content => "Content",
      :user_id => 1,
      :image_url => "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
    rendered.should match(/1/)
    rendered.should match(/Image Url/)
  end
end
