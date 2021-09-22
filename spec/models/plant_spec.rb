require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many(:patches) }
    it { should have_many(:plots).through (:patches) }
  end
end
