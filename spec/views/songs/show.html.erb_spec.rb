require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :song_title => "Song Title",
      :song_artist => "Song Artist",
      :playlist_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Song Title/)
    expect(rendered).to match(/Song Artist/)
    expect(rendered).to match(//)
  end
end
