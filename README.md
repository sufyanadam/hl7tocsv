# Hl7tocsv

Convert HL7 ORU messages to csv. If you just want a list of the results of each observation
to analyze in a spreadsheet, `HL7toCSV` makes it easy!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hl7tocsv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hl7tocsv

## Usage

`HL7toCSV` converts an HL7 ORU message to CSV. The ID column is assumed to be the OBR order placer number.

Example:

```ruby
require 'hl7tocsv'

hl7 = "MSH|^~&|GHH LAB|ELAB-3|GHH OE|BLDG4|200202150930||ORU^R01|CNTRL-3456|P|2.4\nPID|||555-44-4444||EVERYWOMAN^EVE^E^^^^L|JONES|19620320|F|||153 FERNWOOD DR.^^STATESVILLE^OH^35292||(206)3345232|(206)752-121||||AC555444444||67-A4335^OH^20030520\nOBR|1|845439^GHH OE|1045813^GHH LAB|15545^GLC BASELINE|||200202150730|||||||||555-55-5555^PRIMARY^PATRICIA P^^^^MD^^|||||||||F||||||444-44-4444^HIPPOCRATES^HOWARD H^^^^MD\nOBX|1|SN|1554-5^GLUCOSE^POST 12H CFST:MCNC:PT:SER/PLAS:QN||^182|mg/dl|70_105|H|||F\n"

HL7toCSV.convert(hl7) # => ID,GLUCOSE GLC BASELINE\n845439^GHH OE,^182\n
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sufyanadam/hl7tocsv. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

