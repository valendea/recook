require 'rails_helper'

RSpec.describe User, type: :model do
	# before(:each) do
	# 	@user = User.create!(email: 'asd@gmail.com', password: '123456')
	# end

  describe 'validations' do
		it { is_expected.to validate_length_of(:password).is_at_least(7) }
		it { is_expected.to validate_presence_of(:first_name) }
		it { is_expected.to validate_presence_of(:last_name) }
		it { is_expected.to validate_presence_of(:password,) }
		it { is_expected.to validate_presence_of(:email) }
		# describe 'uniqueness' do
			# force uniqueness matcher to use custom created object instead
			# https://github.com/thoughtbot/shoulda-matchers/blob/master/lib/shoulda/matchers/active_record/validate_uniqueness_of_matcher.rb#L50
			# subject ( email: 'gdasj@gmail.com' )
			# it { is_expected.to validate_uniqueness_of(:email) }
		# end
	end

	describe 'associations' do
		it { is_expected.to have_many(:recipes) }
		it { is_expected.to have_many(:votes) }
	end
end
