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
	end

	private

	attr_reader :numbers

	def single_number?
		numbers.length == 1
	end
end