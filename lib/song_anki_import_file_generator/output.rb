require "csv"

module SongAnkiImportFileGenerator
  class Output
    attr_reader :path, :cards

    def initialize(path)
      @path = path
      @cards = []
    end

    def write
      CSV.open(@path, "w") do |csv|
        @cards.each do |card|
          csv << [card.front, card.back]
        end
      end
    end
  end
end
