class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: 60, db: @db)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(name, type, db = @db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db = @db)
    new_val = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: new_val[0], name: new_val[1], type: new_val[2], hp: new_val[3])
  end

  def alter_hp(new_hp, db = @db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
