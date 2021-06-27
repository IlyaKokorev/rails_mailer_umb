FactoryBot.define do
  factory :valid_user, class: User do
    name { 'Ilya' }
    email { 'kockorev.ilya@gmail.com' }
  end

  factory :invalid_user, class: User do
    name { 'N_Ilya' }
    email { 'kockorev.ilya' }
  end
end
