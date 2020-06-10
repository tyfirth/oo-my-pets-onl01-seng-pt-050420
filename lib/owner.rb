class Owner
 
attr_reader :name, :species
attr_accessor :pets, :dog, :cat, :dogs, :cats
 
  @@all = []
  @@pets = {:cats => [], :dogs => []}
 
def initialize(name)
  @name = name
  @species = "human"
  @@all << self
end
 
def say_species
  "I am a #{@species}."
end
 
def self.all
  @@all
end
 
def self.count
  @@all.count
end
 
def self.reset_all
  @@all.clear
end
 
def buy_cat(name)
    Cat.new(name, self)
end
 
def buy_dog(name)
   Dog.new(name, self)
end
 
def cats 
  Cat.all.select {|cat| cat.owner == self}
end
 
def dogs
  Dog.all.select {|dog| dog.owner == self}
end
 
  def list_pets
    self.cats.all 
    self.dogs.all
  end
  
  def sell_pets
    pets.each do |pet, arr|
      arr.map do |pet|
        pet.mood = 'nervous'
      end
      arr.clear
    end
  end
  
  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = 'happy'}
  end
 
end