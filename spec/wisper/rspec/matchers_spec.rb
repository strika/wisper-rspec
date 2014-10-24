require 'wisper/rspec/matchers'

RSpec::configure do |config|
  config.include(Wisper::RSpec::BroadcastMatcher)
end

describe 'broadcast matcher' do
  let(:publisher_class) { Class.new { include Wisper::Publisher } }
  let(:publisher) { publisher_class.new }

  it 'passes when publisher broadcasts inside block' do
    expect { publisher.send(:broadcast, :foobar) }.to broadcast(:foobar)
  end

  it 'passes with not_to when publisher does not broadcast inside block' do
    expect { publisher }.not_to broadcast(:foobar)
  end
end
