require 'rspec'
require_relative '../lesson03/ex01.rb'

describe 'lesson3' do
  context 'check results' do
    let!(:apostolis) { Person.new('Apostolis', 'FooBar') }
    let!(:nikos) { Person.new('Nikos', 'FooBar') }
    let!(:another_person) { Person.new('Another', 'Person') }

    it 'unexpected search result' do
      expect(Person.search('FooBar').size).to be == 2
    end
  end

  context 'check instance properties' do
    subject(:john) { Person.new('Chris', 'Christie') }

    it 'missing first_name' do
      is_expected.to respond_to(:first_name)
    end

    it 'missing last_name' do
      is_expected.to respond_to(:last_name)
    end
  end

  context 'check class properties' do
    subject(:class) { Person }

    it 'missing search' do
      is_expected.to respond_to(:search)
    end
  end
end
