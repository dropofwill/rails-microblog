# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  
	before {@user = User.new(name: "Test User", email: "test@user.org")}
	subject {@user}

	it {should respond_to(:name)}
	it {should respond_to(:email)}

	it {should be_valid}

	describe "when name is not present" do
		before {@user.name = " "}
		it {should_not be_valid}
	end

	describe "when name is too long" do
		before {@user.name = "b" * 51}
		it {should_not be_valid}
	end

	describe "when email is not present" do
		before {@user.email = " "}
		it {should_not be_valid}
	end

	describe "when the email is not valid" do
		before {@user.email = "jj.com"}
		it {should_not be_valid}
	end

	describe "when the email is valid" do
		before {@user.email = "j@j.com"}
		it {should be_valid}
	end

	describe "when email is already in use" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it {should_not be_valid}
	end
end
