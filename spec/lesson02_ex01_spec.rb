require 'rspec'

describe 'lesson2' do
  let(:spec_file) { 'lesson02/ex01.rb' }
  let(:spec_path) { File.expand_path(spec_file, Dir.pwd) }

  context 'output array' do
    let(:result) { `ruby #{spec_path}`.chomp! }
    let(:numbers) { [] }
    let(:lines) do
      [lines.count - 1].split(',').each do |v|
        number = /([0-9]+)/.match(v).to_s.to_i
        numbers << number
      end
    end

    it 'should not contain any number under 5000' do
      numbers.each do |n|
        expect(n).to be >= 5000
      end
    end

    it 'is expected to be sorted in descending order' do
      expect(numbers).to eq numbers.sort.reverse
    end

    it 'should not contain numbers not divisible by 3' do
      numbers.each do |n|
        expect(n % 3).to be.zero?
      end
    end
  end

  context 'implementation' do
    let(:src_code) { File.open(spec_path, 'r').read }

    it 'should contain select' do
      expect(src_code).to include('select')
    end

    it 'should contain reject' do
      expect(src_code).to include('reject')
    end

    it 'should contain sort' do
      expect(src_code).to include('sort')
    end

    it 'should contain reverse' do
      expect(src_code).to include('reverse')
    end
  end
end
