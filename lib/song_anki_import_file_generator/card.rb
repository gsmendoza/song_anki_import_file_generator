module SongAnkiImportFileGenerator
  class Card
    attr_accessor :front, :back

    def initialize(front:, back:)
      @front = front
      @back = back
    end
  end
end
