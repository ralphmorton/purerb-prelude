def self.boolConj
  lambda do |a|
    lambda do |b|
      a && b
    end
  end
end

def self.boolDisj
  lambda do |a|
    lambda do |b|
      a || b
    end
  end
end

def self.boolNot
  lambda do |a|
    !a
  end
end
