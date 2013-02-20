require 'spec_helper'

describe Myrr::Methods::Recommend do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}
  let(:user_id){5}
  let(:options){{}}

  subject{Myrr::Methods::Recommend.new(client,user_id,options)}

  describe "#perform" do
    context "without options" do
      it "performs a GET request with the correct parameters" do
        stub = stub_request(:get, "#{uri}:#{port}/recommend/#{user_id}")
        subject.perform
        stub.should have_been_requested
      end
    end

    context "with additional arguments" do
      let(:number){5}
      let(:options){{:howMany => number, :considerKnownItems => true}}

      it "perfoms a GET request with the correct parameters" do
        stub = stub_request(:get, "#{uri}:#{port}/recommend/#{user_id}").with(:query => {:howMany => number, :considerKnownItems => "true"})
        subject.perform
      end
    end
  end
end