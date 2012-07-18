require 'spec_helper'

describe "Pinpost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "pinpost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.should_not change(pinpost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'pinpost_title', with: "Lorem ipsum" }
	  before { fill_in 'pinpost_url_image', with: "http://yandex.st/www/1.211/yaru/i/logo.png" }
      it "should create a pinpost" do
        expect { click_button "Post" }.should change(Pinpost, :count).by(1)
      end
    end
  end
end