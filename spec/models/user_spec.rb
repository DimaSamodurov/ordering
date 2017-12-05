require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#name' do
    it 'returns first and last name concatenated with space' do
      user = User.new(first_name: 'Dima', last_name: 'Samodurov')

      user_name = user.name

      expect(user_name).to eq 'Dima Samodurov'
    end
  end
end
