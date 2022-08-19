FactoryBot.define do
  factory :message do
    title { "Message Title" }
    content { "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac tortor vitae purus faucibus ornare. Duis convallis convallis tellus id interdum. Pretium viverra suspendisse potenti nullam ac tortor vitae. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean" }
    user
  end

  factory :user do
    email { "user01@gmail.com" }
    password { "secret" }
  end
end