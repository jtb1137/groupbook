require 'rails_helper'

RSpec.describe Post, type: :model do
    context 'Associations' do
        it 'belongs to a user' do
            association = described_class.reflect_on_association(:user).macro
            expect(association).to eq :belongs_to
        end

        it 'belongs to a category' do
            association = described_class.reflect_on_association(:category).macro
            expect(association).to eq :belongs_to
        end
    end
end