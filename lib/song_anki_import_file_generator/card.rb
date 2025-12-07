module SongAnkiImportFileGenerator
  class Card
    attr_accessor :front, :back

    def initialize(front:, back:)
      @front = front
      @back = back
    end

    def to_s
      %(#{front},"#{back}")
    end
  end
end
