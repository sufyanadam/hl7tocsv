require "spec_helper"

describe HL7toCSV do
  it "has a version number" do
    expect(HL7toCSV::VERSION).not_to be nil
  end

  describe '.convert' do
    subject { HL7toCSV.convert(hl7) }
    let(:hl7) { File.read('spec/fixtures/sample.hl7') }

    it "works" do
      expect(subject).to eq "ID,GLUCOSE INITIAL,GLUCOSE POST 12H,INSULIN INITIAL,INSULIN POST 12H\n845439^GHH OE,^182,^200,^20,^40\n"
    end
  end
end
