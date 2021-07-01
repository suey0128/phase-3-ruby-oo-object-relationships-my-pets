class Owner
  attr_reader :name, :species

  @@all = []

  def initialize name, species="human"
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    #go to the all cat arr and find those with self.name
     Cat.all.select{|cat| cat.owner === self}
  end

  def dogs
    #go to the all dog arr and find those with self.name
    Dog.all.select{|dog| dog.owner === self}
  end

  def buy_cat name #take in string
    #create a cat instance and associate it with self
    Cat.new(name,self)
  end

  def buy_dog name
    Dog.new(name,self)
  end

  def walk_dogs
    #access the dog mood and change it 
    self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each{|cat| 
      #make them nervous
      cat.mood = "nervous"
      #leave them without the owner
      cat.owner = nil
    }
    self.dogs.each{|dog| 
      dog.mood = "nervous"
      dog.owner = nil
    }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end

# @owner = Owner.new("Victoria")