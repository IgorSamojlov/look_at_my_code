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

    code { "Some_code" }
    syntax
    expired_at { "2020-05-21 18:08:17" }
    expires { DateTime.now + 1.day }
  end
end
