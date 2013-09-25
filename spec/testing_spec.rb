require 'spec_helper'
require 'testing'

describe Person do
  context 'ActiveAttr::Attributes' do
    let(:person) { build(:people) }

    describe 'given expected attributes' do
      [:first_name,
       :second_name].each do |expected_attribute|
        it 'responds to it' do
          expect(person).to respond_to expected_attribute
        end
        it 'responds to #have_attribute' do
          expect(person).to have_attribute(expected_attribute)
        end
      end
    end
    describe '#first_name' do
      it 'shows first_name' do
        expect(person.first_name).to eq 'John'
      end
    end
    context '#first_name=' do
      before :each do
        person.first_name = 'Jenny'
      end
      it 'updates first_name' do
        expect(person.first_name).to eq 'Jenny'
      end
    end
    describe '#second_name' do
      it 'shows second_name' do
        expect(person.second_name).to eq 'Doe'
      end
    end
    context '#second_name=' do
      before :each do
        person.second_name = 'Simmons'
      end
      it 'updates second_name' do
        expect(person.second_name).to eq 'Simmons'
      end
    end
  end
end

describe City do
  context 'ActiveAttr::AttributeDefaults' do
    let(:city) { build(:cities) }

    describe '#name' do
      it 'set defaults' do
        expect(city).to have_attribute(:name).with_default_value_of 'Valencia'
      end
    end
  end
end

describe Region do
  context 'ActiveAttr::QueryAttributes' do
    let(:region) { build(:regions) }

    describe '#name' do
      it 'can be used with ? if setted' do
        expect(region.name?).to be
      end
    end

    describe '#area' do
      it 'can be used with ? if not setted' do
        expect(region.area?).to be_false
      end
    end
  end
end

describe Area do
  context 'ActiveAttr::TypecastedAttributes' do
    let(:area) { build(:areas) }

    context '#code' do
      before :each do
        area.code = '3'
      end

      it 'admits typecasted attributes' do
        expect(area.code).to eq 3
      end
    end
  end
end

describe Province do
  context 'ActiveAttr::BlockInitialization' do
    let(:province) { build(:provinces) }

    before :each do
      @province = Province.new do |p|
        p.name    = 'Alicante'
        p.country = province.country
      end
    end

    it 'accepts block initialization' do
      expect(@province.name).to eq 'Alicante'
      expect(@province.country).to eq province.country
    end
  end
end

describe Country do
  context 'ActiveAttr::Logger' do
    let(:country) { build(:countries) }

    describe 'admits logger methods' do
      it 'as a champion' do
        expect(country.logger?).to be
      end
    end
  end
end

describe Phone do
  context 'ActiveAttr::BasicModel' do
    let(:phone) { build(:phones) }

    it 'supports validations' do
      expect(phone).to be_valid
    end
    it 'supports errors' do
      expect(phone.errors.full_messages).to eq []
    end
    it 'supports model naming' do
      expect(Phone.model_name.plural).to eq 'phones'
    end
  end
end

describe Smartphone do
  describe 'ActiveAttr::MassAssignment' do
    it 'can receive attributes when initializating object' do
      smartphone = Smartphone.new(model: 'MySMPhone 69')
      expect(smartphone.model).to eq 'MySMPhone 69'
    end
    it 'can handle attributes, declared by attr_accessor' do
      smartphone = Smartphone.new(model: 'MySMPhone 69')
      smartphone.attributes = { sn: 'TIMO4EVER' }
      expect(smartphone.sn).to eq 'TIMO4EVER'
    end
  end
end

describe Tablet do
  context 'ActiveModel::MassAssignmentSecurity' do
    let(:tablet) { Tablet.new(model: 'MySMPhone 69', price: 1) }

    it 'can support protected attributes' do
      expect(tablet.model).to eq 'MySMPhone 69'
      expect { tablet.price }.to raise_error
    end
  end
end

describe Desktop do
  context 'ActiveModel::ForbiddenAttributesProtection' do
    let(:desktop) { Desktop.new(model: 'MySMPhone 69', price: 1) }

    it 'can support protected attributes' do
      expect(desktop.model).to eq 'MySMPhone 69'
      expect { desktop.price }.to raise_error
    end
  end
end

describe Laptop do
  context 'ActiveAttr::Serialization' do
    let(:laptop) { build(:laptops) }

    it 'serialized to and from JSON' do
      expect(Laptop.new.from_json(laptop.to_json).model).to eq 'MyNewLaptop 4EV'
    end
  end
end

describe Keyboard do
  context 'ActiveAttr::Model' do
    let(:keyboard) { build(:keyboards) }

    describe 'includes ActiveAttr::BasicModel features' do
      describe 'given expected attributes' do
        [:model,
         :brand,
         :country].each do |expected_attribute|
          it 'responds to it' do
            expect(keyboard).to respond_to expected_attribute
          end
          it 'responds to #have_attribute' do
            expect(keyboard).to have_attribute(expected_attribute)
          end
        end
      end
      describe '#brand' do
        it 'shows brand' do
          expect(keyboard.brand).to eq 'MyAmazingBrand'
        end
      end
      context '#brand=' do
        before :each do
          keyboard.brand = 'MyNewAmazingBrand'
        end
        it 'updates brand' do
          expect(keyboard.brand).to eq 'MyNewAmazingBrand'
        end
      end
      describe '#country' do
        it 'shows country' do
          expect(keyboard.country).to eq 'Spain'
        end
      end
      context '#country=' do
        before :each do
          keyboard.country = 'France'
        end
        it 'updates country' do
          expect(keyboard.country).to eq 'France'
        end
      end
    end

    describe 'includes ActiveAttr::Attributes features' do
      describe '#model' do
        it 'shows model' do
          expect(keyboard.model).to eq 'KB4EV'
        end
      end
      context '#model=' do
        before :each do
          keyboard.model = 'KB4EV'
        end
        it 'updates model' do
          expect(keyboard.model).to eq 'KB4EV'
        end
      end
    end

    describe 'includes ActiveAttr::QueryAttributes features' do
      describe '#model' do
        it 'can be used with ? if setted' do
          expect(keyboard.model?).to be
        end
      end

      describe '#brand' do
        before :each do
          keyboard.brand = false
        end

        it 'can be used with ? if not setted' do
          expect(keyboard.brand?).to be_false
        end
      end
    end

    describe 'includes ActiveAttr::AttributeDefaults features' do
      describe '#model' do
        it 'set defaults' do
          expect(keyboard).to have_attribute(:model).with_default_value_of 'KB4EV'
        end
      end
    end

    describe 'includes ActiveAttr::MassAssignment features' do
      it 'can receive attributes when initializating object' do
        smartphone = Smartphone.new(model: 'MySMPhone 69')
        expect(smartphone.model).to eq 'MySMPhone 69'
      end
      it 'can handle attributes, declared by attr_accessor' do
        smartphone = Smartphone.new(model: 'MySMPhone 69')
        smartphone.attributes = { sn: 'TIMO4EVER' }
        expect(smartphone.sn).to eq 'TIMO4EVER'
      end
    end

    describe 'includes ActiveAttr::Logger features' do
      describe 'admits logger methods' do
        it 'as a champion' do
          expect(keyboard.logger?).to be
        end
      end
    end
  end
end
