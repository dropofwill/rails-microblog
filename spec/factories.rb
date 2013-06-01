FactoryGirl.define do
	factory :user do
		name "Mike Hurts"
		email "mikehurts@hertz.org"
		password "foobar"
		password_confirmation "foobar"
	end
end