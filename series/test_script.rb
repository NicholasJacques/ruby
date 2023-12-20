require_relative 'series'
require 'ruby-prof'

RubyProf.measure_mode = RubyProf::MEMORY
#RubyProf.measure_mode = RubyProf::PROCESS_TIME

RubyProf.start
10000.times do
    series = SeriesTwo.new("918493904243")
    series.slices(5)
end
result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)

RubyProf.start
10000.times do
    series = Series.new("918493904243")
    series.slices(5)
end
result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)