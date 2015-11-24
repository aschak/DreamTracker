FactoryGirl.define do  factory :goal_comment do
    
  end
  factory :user_comment do
    
  end


  factory :goal do
    title "My Goal Title"
    description "Goal description"

    factory :no_title_goal do
      title ""
    end

    factory :no_description_goal do
      description ""
    end
  end

  factory :user do
    username "test_name"
    password "password"
  end
end
