require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many(:patches) }
    it { should have_many(:plants).through (:patches) }
  end
end
