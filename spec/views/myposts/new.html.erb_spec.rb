require 'spec_helper'

describe "myposts/new" do
  before(:each) do
    assign(:mypost, stub_model(Mypost,
      :content => "MyString",
      :user_id => 1,
      :image_url => "MyString"
    ).as_new_record)
  end

  it "renders new mypost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => myposts_path, :method => "post" do
      assert_select "input#mypost_content", :name => "mypost[content]"
      assert_select "input#mypost_user_id", :name => "mypost[user_id]"
      assert_select "input#mypost_image_url", :name => "mypost[image_url]"
    end
  end
end
