require 'bundler'
Bundler.require


class Gossip
    attr_accessor :author, :content
    def initialize(author, content)
        @author = author
        @content = content
    end

    def save #Permet l'enregistrement des Gossip dans la base de données
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
      end

      def self.all #Permet l'affichage des gossip sur la page d'acceuil
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
      end

      def self.find(id) #Permet la recherche des Gossip en fonction de leurs ID
        return Gossip.all[id]
      end
end
