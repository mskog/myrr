require 'spec_helper'

describe Myrr::Methods::Recommend do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}
  let(:user_id){5}
  let(:options){{}}

  subject{Myrr::Methods::Recommend.new(client,user_id,options)}

  describe "#perform" do
    let(:raw_response_file){File.new('spec/fixtures/recommend/single.txt')}

    context "without options" do
      it "performs a GET request with the correct parameters" do
        stub = stub_request(:get, "#{uri}:#{port}/recommend/#{user_id}").with(:headers => {'Content-Type' => 'application/json'}).to_return(raw_response_file)
        subject.perform
        stub.should have_been_requested
      end

      it "returns recommendations with the correct size" do
        raw_response_file = File.new('spec/fixtures/recommend/single.txt')
        stub = stub_request(:get, "#{uri}:#{port}/recommend/#{user_id}").with(:headers => {'Content-Type' => 'application/json'}).to_return(raw_response_file)
        recommendations = subject.perform
        recommendations.count.should eq 10
      end

      it "returns the expected recommendations" do
        raw_response_file = File.new('spec/fixtures/recommend/single.txt')
        stub = stub_request(:get, "#{uri}:#{port}/recommend/#{user_id}").with(:headers => {'Content-Type' => 'application/json'}).to_return(raw_response_file)
        recommendations = subject.perform
        recommendations.first.to_a.should eq [user_id, 305,0.72179806]
      end
    end

    context "with additional arguments" do
      let(:number){5}
      let(:options){{:how_many => number, :consider_known_items => true}}

      it "perfoms a GET request with the correct parameters" do
        stub = stub_request(:get, "#{uri}:#{port}/recommend/#{user_id}").with(
          :query => {:howMany => number, :considerKnownItems => "true"},
          :headers => {'Content-Type' => 'application/json'}
        ).to_return(raw_response_file)
        subject.perform
      end
    end

    context "with illegal options" do
      let(:number){5}
      let(:options){{:how_many => number, :consider_known_items => true, :foo => 'bar'}}

      it "perfoms a GET request with the correct parameters" do
        stub = stub_request(:get, "#{uri}:#{port}/recommend/#{user_id}").with(
          :query => {:howMany => number, :considerKnownItems => "true"},
          :headers => {'Content-Type' => 'application/json'}
        ).to_return(raw_response_file)
        subject.perform
      end
    end
  end
end