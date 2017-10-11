require 'minitest/autorun'
require_relative 'dog'

class DogTest < Minitest::Test

	def setup
		puts "setup"
		@dog = Dog.new("Rex")
	end

	def test_initialize_with_no_arg
		assert_raises(ArgumentError) do @dog_no_args = Dog.new
		end
	end

	def test_initialize_with_arg
		assert_equal "Rex", @dog.name
		assert_equal "Dog", @dog.species
		assert_equal 0, @dog.speed
		assert_equal 0, @dog.legs
	end

	def test_variable_data_types
		assert_instance_of String, @dog.name
		assert_instance_of String,  @dog.species
		assert_kind_of Numeric, @dog.speed
		assert_kind_of Numeric, @dog.legs
	end

	def test_if_variables_are_accessible
		@dog.name = "Sam"
		assert_equal "Sam", @dog.name
		@dog.species = "Cat"
		assert_equal "Cat", @dog.species
		@dog.speed = 350
		assert_equal 350, @dog.speed
		@dog.legs = 8
		assert_equal 8, @dog.legs
	end

	def test_walk_with_zero
		assert_equal 0, @dog.walk
	end

	def test_walk_with_num
		@dog.legs = 4
		current_speed = @dog.speed
		assert_equal (current_speed + (0.2*4)), @dog.walk
		assert_kind_of Numeric, @dog.walk
	end

	def test_instance_of_dog
		assert_instance_of Dog, @dog
	end

	def test_kind_of_dog
		assert_kind_of Animal, @dog
	end

	def teardown
		puts "teardown"
	end

end
