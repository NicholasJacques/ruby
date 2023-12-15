class LogLineParser
  def initialize(line)
    @line = line
    @message = @line.split(/(?<=[:])/)[1..-1].join().strip
    @level = @line[/\[(.*?)\]/, 1].downcase
  end

  def message
    @message
  end

  def log_level
    @level
  end

  def reformat
    "#{@message} (#{@level})"
  end
end
