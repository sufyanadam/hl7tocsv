require "simple_hl7_parser"
require 'csv'
require "hl7tocsv/version"

module HL7toCSV
  def self.convert(hl7s)
    parsed = Array(hl7s).map { |hl7| SimpleHL7Parser::HL7.parse(hl7) }
    headers = determine_headers(parsed)

    parsed.reduce([]) do |reduced, hl7|
      write_headers = hl7 == parsed.first
      reduced << hl7_to_csv(hl7, headers, write_headers)
      reduced
    end.join("\n")
  end

  def self.determine_headers(hl7s)
    hl7s.reduce([]) do |reduced, hl7|
      reduced << hl7.obx.map { |obx| obx.observation_identifier.split('^')[1] + ' ' + obx.obr.universal_service_id.split('^')[1].strip }
    end.flatten.
      uniq.
      sort
  end

  def self.hl7_to_csv(hl7, headers, write_headers = true)
    hash = hl7.obx.reduce({}) do |h, obx|
      h[obx.observation_identifier.split('^')[1] + ' ' + obx.obr.universal_service_id.split('^')[1].strip] = obx.observation_value
      h
    end

    CSV.generate(write_headers: write_headers, headers: ['ID'] + headers, encoding: 'utf-8') do |csv|
      csv << [hl7.obr.first.placer_order_number] + headers.map { |h| hash[h] }
    end
  end
end
