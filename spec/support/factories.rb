FactoryGirl.define do
  factory :artist do
    name
    image_path "https://upload.wikimedia.org/wikipedia/commons/b/b2/Taylor_Swift_Red_Tour_2%2C_2013.jpg"
  end

  sequence :name do |n|
    "#{n} Artist"
  end

  sequence :title, ["A", "C", "B"].cycle do |n|
    "#{n} Title"
  end

  factory :song do
    title
    artist
  end
end
