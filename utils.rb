module Utils
  class AutoIncrementId
    @@next_id = 1

    def self.get_id
      @@next_id += 1
      @@next_id - 1
    end
  end
end