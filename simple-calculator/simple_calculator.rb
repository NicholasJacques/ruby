

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end
  
  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation.new() unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError unless first_operand.is_a?(Numeric) && second_operand.is_a?(Numeric)

    begin
      result = first_operand.public_send(operation, second_operand)
    rescue ZeroDivisionError => e
      return "Division by zero is not allowed."
    end
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end

