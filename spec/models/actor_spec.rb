require 'rails_helper'

RSpec.describe Actor, type: :model do
  it { is_expected.to belong_to(:movie) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }

  it { is_expected.to validate_length_of(:role).is_at_most(50) }
end
