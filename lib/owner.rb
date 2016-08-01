require 'pry'

class Owner
  attr_accessor :name, :pets
  attr_reader :species


  @@all = []
  @@count = 0

  def initialize(species)
    @species = species
    @pets = { fishes: [],
              dogs:   [],
              cats:   []}
    @@count += 1
    @@all << self
  end

  def self.reset_all
    @@all = []
    @@count = 0
  end

  def self.count
    @@count
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    @pets[:fishes] << new_fish
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    @pets[:cats] << new_cat
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy" }
  end

  def sell_pets
    @pets.each do |pet_type, pets|
      pets.each {|pet| pet.mood = "nervous"}
    end
    @pets = { fishes: [],
              dogs:   [],
              cats:   []}
  end

  def list_pets
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end
  
end




