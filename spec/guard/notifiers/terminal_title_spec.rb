require 'spec_helper'

describe Guard::Notifier::TerminalTitle do
  let(:notifier) { described_class.new }

  describe '.available?' do
    it 'returns true' do
      described_class.should be_available
    end
  end

  describe '#notify' do
    it 'set title + first line of message to terminal title' do
      notifier.should_receive(:puts).with("\e]2;[any title] first line\a")

      notifier.notify("first line\nsecond line\nthird", title: 'any title')
    end
  end

  describe '.turn_off' do
    it 'clears the terminal title' do
      described_class.should_receive(:puts).with("\e]2;\a")

      described_class.turn_off
    end
  end

end
