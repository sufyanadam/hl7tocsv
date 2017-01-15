require "spec_helper"

describe HL7toCSV do
  it "has a version number" do
    expect(HL7toCSV::VERSION).not_to be nil
  end

  describe '.convert' do
    subject { HL7toCSV.convert(hl7) }
    let(:hl7) { File.read('spec/fixtures/sample.hl7') }

    it "works" do
      expect(subject).to eq "ID,GLUCOSE GLUCOSE\n845439^GHH OE,^182\n"
    end
  end
end
