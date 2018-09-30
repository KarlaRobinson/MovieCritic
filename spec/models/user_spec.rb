require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { is_expected.to have_many(:movies) }

  describe 'name' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }

    it { is_expected.to allow_value("Karla Robinson").for(:name) }
    it { is_expected.to_not allow_value("Karla 4R").for(:name) }
  end

  describe 'email' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    
    it { is_expected.to allow_value("email@addresse.foo").for(:email) }
    it { is_expected.to_not allow_value("foo").for(:email) }
  end
end
