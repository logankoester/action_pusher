require 'spec_helper'

describe ActionPusher::Base do
  let(:data) { { :test => 'string' }.to_json }

  it "has pushable object" do
    expect(ActionPusher::Base::Pushable).to be_truthy
  end

  it "has TestPusher object" do
    expect(TestPusher).to be_truthy
  end

  it "calls renders correctly" do
    expect(TestPusher::Pushable).to receive(:push).with('channel', 'event', data)
    TestPusher.new
  end
end
