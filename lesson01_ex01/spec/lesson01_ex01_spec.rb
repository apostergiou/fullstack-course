require 'rspec'

describe 'lesson1' do
  context 'check results' do
    result = `ruby ../lesson01_ex01/lesson01_ex01.rb`.chomp!

    it 'unexpected output' do
      expect(result).to eq('I guess nothing matched... But why?')
    end
  end

  context 'check implementation' do
    src_code = File.open('../lesson01_ex01/lesson01_ex01.rb', 'r').read

    it 'remove if clause' do
      expect(src_code).not_to include('if')
    end

    it 'remove elsif clause' do
      expect(src_code).not_to include('elsif')
    end

    it 'keep else clause' do
      expect(src_code).to include('else')
    end

    it 'missing case' do
      expect(src_code).to include('case')
    end
  end
end
