FactoryBot.define do  
  
  factory :platform do
    key "nts"
    name "nts live"
    
    factory :platform_with_episodes do
      transient do 
        episodes_count 5
      end
      after(:create) do |platform, evaluator|
        create_list(:episode, evaluator.episodes_count, platform: platform)
      end
    end    
  end
end