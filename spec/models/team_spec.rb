require 'rails_helper'

RSpec.describe Team, type: :model do
  let!(:team) { build(:team) }

  it 'should create a team' do
    expect do
      create(:team)
    end.to change(Team, :count).by(1)
  end

  context 'Validates' do
    it 'is not valid without name' do
      team = build(:team, name: nil)
      team.valid?
      expect(team).to be_invalid
    end
  end
end
