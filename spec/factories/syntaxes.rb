# frozen_string_literal: true

FactoryBot.define do
  factory :syntax do
    name {"MyString"}
    lang {name.slice(2)}
  end
end
