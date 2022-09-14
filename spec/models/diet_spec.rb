require 'rails_helper'

RSpec.describe Diet, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:diet_meals) }
    it { should have_many(:meals).through(:diet_meals) }
  end

  describe 'Validations' do
    context 'all attributes' do
      it 'is valid with valid attributes' do
        expect(build(:diet)).to be_valid
      end
    end

    context 'user' do
      it 'is invalid if user does not exist' do
        expect(build(:diet, user: nil)).not_to be_valid
      end
    end

    context 'date' do
      it 'is not valid if date is blank' do
        expect(build(:diet, date: nil)).not_to be_valid
      end

      it 'is not valid if date is incorrect' do
        expect(build(:diet, date: '2021-99-99')).to_not be_valid
      end

      it 'is not valid if date is not unique' do
        first_diet = build(:diet, date: '2021-09-09')
        second_diet = first_diet.dup
        expect(second_diet).to_not be_valid
      end

      it 'is not valid if date is in the past' do
        diet = build(:diet, date: '2021-01-01')
        diet.valid?
        expect(diet.errors[:date][0]).to eq 'is in the past.'
      end
    end
  end
end