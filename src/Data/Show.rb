def self.showImpl
  lambda do |v|
    v.to_s
  end
end

def self.showArrayImpl
  lambda do |f|
    lambda do |vx|
      vx.map { |v| f.call(v) }
    end
  end
end
