require 'rails_helper'

RSpec.describe Trainer, type: :model do
  let!(:trainer) { build(:trainer, name: 'Lukas') }

  describe '#register with same email' do
    it 'should create a trainer' do
      expect do
        create(:trainer)
      end.to change(Trainer, :count).by(1)
    end
  end

  it 'is valid with email, password' do
    expect(trainer).to be_valid
  end

  context 'Validates' do
    it 'is not valid without email' do
      trainer = build(:trainer, email: nil)
      trainer.valid?
      expect(trainer).to be_invalid
    end

    it 'is not valid without password' do
      trainer = build(:trainer, password: nil)
      trainer.valid?
      expect(trainer).to be_invalid
    end

    it 'is not valid with wrong password confirmation' do
      trainer = build(:trainer, password_confirmation: Devise.friendly_token.first(6))
      trainer.valid?
      expect(trainer).to be_invalid
    end
  end
end
