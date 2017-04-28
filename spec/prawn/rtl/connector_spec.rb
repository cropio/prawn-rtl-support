require 'spec_helper'

RSpec.describe Prawn::Rtl::Connector do
  let(:initial_codepoints) { [1580, 1576, 1587, 32, 1586, 1585, 1575, 1593, 1609, 32, 45, 32, 1587, 1575, 1574, 1576] }
  let(:initial_string) { initial_codepoints.pack('U*') }
  let(:final_codepoints) { [65168, 65163, 65166, 65203, 32, 45, 32, 65264, 65227, 65165, 65197, 65199, 32, 65202, 65170, 65183] }
  let(:final_string) { final_codepoints.pack('U*') }

  it 'connect arabic string and reverse' do
    expect(Prawn::Rtl::Connector.fix_rtl(initial_string)).to eq(final_string)
  end
end
