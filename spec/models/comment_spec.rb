require 'rails_helper'

RSpec.describe Comment, type: :model do
  # it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:movie) }

  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_length_of(:subject).is_at_most(50) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_most(200) }
end
