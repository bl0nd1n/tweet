require 'spec_helper'

describe Pinpost do

 let(:user) { FactoryGirl.create(:user) }
  before { @pinpost = user.pinposts.build(title: "Lorem ipsum") }

  subject { @pinpost }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }

describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Pinpost.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
 
   describe "when user_id is not present" do
    before { @pinpost.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank content" do
    before { @pinpost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @pinpost.content = "a" * 141 }
    it { should_not be_valid }
  end
  
end