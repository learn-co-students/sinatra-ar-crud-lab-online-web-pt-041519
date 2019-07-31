#Placeholder for a model

class Article < ActiveRecord::Base[5.1]

    attr_accessor :title, :content

    @@all = []
    
    def initialize(params)
        @title = title
        @content = content
        @@all << self
    end

    def self.all
        @@all
    end

end