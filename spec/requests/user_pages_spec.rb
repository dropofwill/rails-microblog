require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it {should have_selector('h1',    text: 'Sign Up')}
    it {should have_selector('title', text: 'Sign Up')}

    let(:submit) {"Create my account"}

    describe "with invalid info" do
    	it "should not create a user" do
    		expect {click_button submit}.not_to change(User, :count)
    	end
    end

    describe "with valid info" do
    	before do
    		fill_in "Name", with: "Example Dude"
    		fill_in "Email", with: "dude@example.com"
    		fill_in "Password", with: "foobar"
    		fill_in "Confirm", with: "foobar"
    	end

    	it "should create a user" do
    		expect {click_button submit}.to change(User, :count).by(1)
    	end
    end
  end

  describe "profile page" do
  	let(:user) {FactoryGirl.create(:user)}
  	before {visit user_path(user)}

  	it {should have_selector('h1', text: user.name)}
  	it {should have_selector('title', text: user.name)}
  end
end