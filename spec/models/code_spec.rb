# frozen_string_literal: true

RSpec.describe Code, type: :model do
  it 'validation code' do
    expect(create :code).to be_persisted
  end

  it 'code is empty' do
    code = described_class.new(
      code: '',
      expires: DateTime.now,
      expired_at: DateTime.now + 1.day
    )
    expect(code).not_to be_valid
    expect(code.errors[:code]).to eq(["can't be blank"])
  end

  it 'code, expired_at, expired_at,  is empty' do
    code = described_class.new(
      code: '',
    )
    expect(code).not_to be_valid
    expect(code.errors[:code]).to eq(["can't be blank"])
    expect(code.errors[:expired_at]).to eq(["can't be blank"])
    expect(code.errors[:expires]).to eq(["can't be blank"])
  end
end
