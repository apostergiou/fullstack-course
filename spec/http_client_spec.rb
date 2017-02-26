require_relative '../http_client/http_client.rb'
require 'rspec'
require 'webmock/rspec'

describe Recipe do
  let(:recipe_file) { 'http_client/chocolate_recipe.json' }
  let(:json_file_path) { File.expand_path(recipe_file, Dir.pwd) }

  subject { Recipe }

  it { is_expected.to respond_to(:for) }

  it 'has a developer key' do
    expect(subject.default_params).to include :key
    expect(subject.default_params[:key]).to eq ENV['FOOD2FORK_KEY']
  end

  it 'has a base uri set' do
    expect(subject.base_uri).to include 'http://food2fork.com/api'
  end

  describe 'search' do
    before :each do
      stub_request(:get, 'http://food2fork.com/api/search?key=&q=chocolate').
        with(headers: {
               'Accept' => '*/*',
               'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
               'User-Agent' => 'Ruby'
             }).
        to_return(body: File.read(json_file_path),
                  status: 200,
                  headers: { 'Content-Type' => 'application/json' })
    end

    subject { Recipe.for('chocolate') }

    it { is_expected.to be_an Array }
    it { expect(subject.size).to eq 30 }

    it 'contains a title and a social rank' do
      expect(subject.sample).to have_key 'title'
      expect(subject.sample).to have_key 'social_rank'
    end
  end
end
