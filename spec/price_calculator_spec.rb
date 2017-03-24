require_relative '../price_calculator'
RSpec.describe PriceCalculator do
  describe '#total' do
    subject { described_class.new(books).total }

    context 'when buying 1 book' do
      let(:books) { [0] }
      it { is_expected.to eq 8 }
    end

    context 'when buying 2 copies of the same book' do
      let(:books) { [3, 3] }
      it { is_expected.to eq 16 }
    end

    context 'when buying 2 different books' do
      let(:books) { [0, 1, 2] }
      it { is_expected.to eq 21.60 }
    end

    context 'when buying 3 different books' do
      let(:books) { [0, 1] }
      it { is_expected.to eq 15.20 }
    end

    context 'when  parameters is not an array' do
      let(:books) { 'hello' }
      it 'throws and error' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end
  end

  describe '#discount' do
    subject { described_class.new(books).discount }

    context 'when buying 2 different books' do
      let(:books) { [3, 4] }
      it { is_expected.to eq 0.05 }
    end

    context 'when buying 2 of the same book' do
      let(:books) { [1, 1] }
      it { is_expected.to eq 0 }
    end

    context 'when buying 3 different books' do
      let(:books) { [0, 1, 2, 1] }
      it { is_expected.to eq  0.10 }
    end

    context 'when buying 4 different books' do
      let(:books) { [0, 1, 2, 3] }
      it { is_expected.to eq  0.20 }
    end
    context 'when buying 5 different books' do
      let(:books) { [0, 1, 2, 3, 4] }
      it { is_expected.to eq  0.25 }
    end
  end
end
