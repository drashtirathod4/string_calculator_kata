class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    # Check for custom delimiter
    if numbers.start_with?("//")
      delimiter, numbers = numbers.split("\n", 2)
      delimiter = delimiter[2..-1] # Extract the delimiter
      numbers = numbers.split(delimiter).map(&:to_i).sum
    else
      # Handle default comma and newline delimiters
      numbers = numbers.split(/[\n,]/).map(&:to_i).sum
    end

    numbers
  end
end
