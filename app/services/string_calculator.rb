class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    # Check for custom delimiter
    if numbers.start_with?("//")
      delimiter, numbers = numbers.split("\n", 2)
      delimiter = delimiter[2..-1] # Extract the delimiter
      numbers = numbers.split(delimiter).map(&:to_i)
    else
      # Handle default comma and newline delimiters
      numbers = numbers.split(/[\n,]/).map(&:to_i)
    end

    negatives = numbers.select { |num| num < 0 }
    if negatives.any?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}"
    end

    numbers.sum
  end
end
