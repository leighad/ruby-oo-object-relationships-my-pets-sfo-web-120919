class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    "I am a #{self.species}."  
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|c| self == c.owner}
  end

  def dogs
    Dog.all.select {|d| self == d.owner}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each {|d| d.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|c| c.mood = "happy"}
  end

  def sell_pets
    all_pets = (self.cats + self.dogs)
    all_pets.map do |p|
      p.mood = "nervous"
      p.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end