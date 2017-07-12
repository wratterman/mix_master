FactoryGirl.define do
  factory :artist do
    sequence :name do |i|
      "Bob #{i}Marley"
    end
    image_path "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end

  trait :with_songs do
    transient do
      song_count 3
    end

    after :create do |artist, evaluator|
      create_list(:song, evaluator.song_count, artist: artist)
    end
  end
end
