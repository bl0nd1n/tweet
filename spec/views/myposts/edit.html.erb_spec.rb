require 'spec_helper'

describe "myposts/edit" do
  before(:each) do
    @mypost = assign(:mypost, stub_model(Mypost,
      :content => "MyString",
      :user_id => 1,
      :image_url => "MyString"
    ))
  end

  it "renders the edit mypost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => myposts_path(@mypost), :method => "post" do
      assert_select "input#mypost_content", :name => "mypost[content]"
      assert_select "input#mypost_user_id", :name => "mypost[user_id]"
      assert_select "input#mypost_image_url", :name => "mypost[image_url]"
    end
  end
end
