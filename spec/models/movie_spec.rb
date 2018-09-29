require 'rails_helper'

RSpec.describe Movie, type: :model do
  # it { is_expected.to belong_to(:user)}
    it { is_expected.to have_many(:actors) }
    it { is_expected.to have_many(:comments) }

  describe ':title' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(50) }
  end

  describe ':genre' do
    let(:genres) { %w(comedy drama international romcom horro suspense classic) }

    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_inclusion_of(:genre).in_array(genres) }
  end

  describe ':director' do
    it { is_expected.to validate_presence_of(:director) }
    it { is_expected.to validate_length_of(:director).is_at_most(50) }
  end

  describe ':prod_year' do
    it { is_expected.to validate_presence_of(:prod_year) }
    it { is_expected.to validate_numericality_of(:prod_year).is_greater_than_or_equal_to(1870) }
    it { is_expected.to validate_numericality_of(:prod_year).is_less_than(2019) }
  end

  describe ':rating' do
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_inclusion_of(:rating).in_array( [1, 2, 3, 4, 5] ) }
  end
end





