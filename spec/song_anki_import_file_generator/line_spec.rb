require "spec_helper"

RSpec.describe SongAnkiImportFileGenerator::Line do
  describe "#to_card" do
    context "when the line is the first line of the song" do
      let(:song) { SongAnkiImportFileGenerator::Song.new }
      let(:stanza) { SongAnkiImportFileGenerator::Stanza.new(title: "Intro") }
      let(:line) { described_class.new(text: "...         Then off to reap the corn,") }

      before do
        song.add_stanza(stanza)
        stanza.add_line(line)
      end

      it "sets the front of the card to 'First Line'" do
        card = line.to_card

        expect(card.front).to eq("First Line")
        expect(card.back).to eq("Intro\n...         Then off to reap the corn,")
      end
    end
  end
end
