FactoryBot.define do
  factory :user do
      nickname              {Faker::Name.initials}
      email                 {Faker::Internet.free_email}
      password              {"a123456"}
      password_confirmation {password}
      first_name            {"山田"}
      last_name             {"太朗"}
      first_name_katakana   {"ヤマダ"}
      last_name_katakana    {"タロウ"}
      birth_date            {Faker::Date.birthday}
  end
end