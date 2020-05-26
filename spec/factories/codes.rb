# frozen_string_literal: true

FactoryBot.define do
  factory :code do
    sequence :title do |n|
      "Title_#{n}"
    end

    sequence :author do |n|
      "Authore_#{n}"
    end

    sequence :permalink do |n|
      "perm_#{SecureRandom.hex(50+n)}"
    end

    code { "Some code" }
    syntax
    expired_at { Time.now + 1.day }
    expires { '1.week' }
  end
end
