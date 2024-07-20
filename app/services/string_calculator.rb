class StringCalculator
  #initialize variables that will be used inside class
	def initialize(numbers)
		@numbers = numbers
	end
  
  #adds string numbers values
  def self.add(numbers)
		new(numbers).add
	end

  #addition of the numbers
	def add
		return 0 if numbers.empty?
		return numbers.to_i if single_number? #check input is single number then just return it
    
    begin
      number_list = extract_numbers #extract numbers from string input
      puts "=====number_list======#{number_list}"
      check_negatives(number_list)
      number_list.sum
    rescue => e
      puts "Exception caught #{e.message}"
      raise e 
    end
	end

	private

	attr_reader :numbers

	def single_number?
		numbers.length == 1
	end

  def custom_delimiter?
		numbers.start_with?("//")
	end

	def delimiter
		return /,|\n/ unless custom_delimiter?

		custom_delimiter = numbers.match(%r{//(.)\n})[1]
		Regexp.escape(custom_delimiter)
	end

	def extract_numbers
		if custom_delimiter?
			_, number_string = numbers.split("\n", 2)
		else
			number_string = numbers
		end
		number_string.split(/#{delimiter}/).map(&:to_i)
	end

  #check is there any negative numbers are there or not
	def check_negatives(number_list)
		negatives = number_list.select { |n| n < 0 }
		raise "negative numbers are not allowed: #{negatives.join(', ')}" unless negatives.empty?
	end
end