# frozen_string_literal: true

RSpec.describe Syntax, type: :model do
  it 'create syntax' do
    expect(create :syntax).to be_persisted
  end

  it 'validation for syntax' do
    syntax = described_class.new name: '', lang: ''

    expect(syntax).not_to be_valid
    expect(syntax.errors[:name]). to eq(["can't be blank"])
    expect(syntax.errors[:lang]). to eq(["can't be blank"])
  end
end
