require 'rspec'

describe 'lesson1' do
  let(:spec_file) { 'lesson01_ex01/ex01.rb' }
  let(:spec_path) { File.expand_path(spec_file, Dir.pwd) }

  context 'check results' do
    let(:result) { `ruby #{spec_path}`.chomp! }

    it 'unexpected output' do
      expect(result).to eq('I guess nothing matched... But why?')
    end
  end

  context 'check implementation' do
    let(:src_code) { File.open(spec_path, 'r').read }

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
