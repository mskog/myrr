require 'spec_helper'

describe Myrr::Methods::Ready do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}

  subject{Myrr::Methods::Ready.new(client)}

  describe "#perform" do
    context "when the service is ready" do
      it "returns true" do
        stub = stub_request(:head, "#{uri}:#{port}/ready").to_return(:status => 200)
        subject.perform.should be_true
      end
    end

    context "when the service is not ready" do
      it "returns false" do
        stub = stub_request(:head, "#{uri}:#{port}/ready").to_return(:status => 503)
        subject.perform.should be_false
      end
    end
  end
end