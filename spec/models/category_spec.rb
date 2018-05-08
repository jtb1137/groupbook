require 'rails_helper'

RSpec.describe Category, type: :model do
    context 'Associations' do
        it 'has many posts' do
            association = described_class.reflect_on_association(:posts).macro
            expect(association).to eq :has_many
        end
    end
end