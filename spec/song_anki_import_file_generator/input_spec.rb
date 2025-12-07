require "spec_helper"

RSpec.describe SongAnkiImportFileGenerator::Input do
  describe "#to_song" do
    it "returns a song from the content" do
      content = File.read("spec/fixtures/Jack O’Connell, Brian Dunphy & Darren Holden - Rocky Road to Dublin.yml.txt")
      input = SongAnkiImportFileGenerator::Input.new(content)
      song = input.to_song

      expect(song).to be_a(SongAnkiImportFileGenerator::Song)

      aggregate_failures do
        expect(song.stanzas.size).to eq(13)
        expect(song.stanzas.first.lines.size).to eq(10)
        expect(song.stanzas[1].lines.size).to eq(18)
        expect(song.stanzas.last.lines.size).to eq(4)
      end
    end
  end
end
