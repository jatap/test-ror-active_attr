FactoryGirl.define do
  factory :people, class: 'Person' do
    first_name  'John'
    second_name 'Doe'
  end

  factory :cities, class: 'City' do
    name   'Valencia'
    region 'Levante'
  end

  factory :regions, class: 'Region' do
    name   'Levante'
  end

  factory :areas, class: 'Area' do
    name     'East'
    province 'Valencia'
    code     3
  end

  factory :provinces, class: 'Province' do
    name    'Valencia'
    country 'Spain'
  end

  factory :countries, class: 'Country' do
  end

  factory :phones, class: 'Phone' do
  end

  factory :smartphones, class: 'Smartphone' do
  end

  factory :tablets, class: 'Tablet' do
  end

  factory :desktops, class: 'Desktop' do
  end

  factory :laptops, class: 'Laptop' do
    model 'MyNewLaptop 4EV'
  end

  factory :keyboards, class: 'Keyboard' do
    model   'KB4EV'
    brand   'MyAmazingBrand'
    country 'Spain'
  end
end