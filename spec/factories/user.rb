FactoryGirl.define do

  factory :user do # FactoryGirl will assume that the parent model of a factory named ":user" is "User".
    email 'foo@bar.com'
    password 'secret1234'
    name 'Dave'
    username 'WaveyDavey'
  end

end