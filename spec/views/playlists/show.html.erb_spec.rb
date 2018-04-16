require 'rails_helper'

RSpec.describe "playlists/show", type: :view do
  before(:each) do
    @playlist = assign(:playlist, Playlist.create!(
      :playlist_name => "Playlist Name",
      :creator_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Playlist Name/)
    expect(rendered).to match(//)
  end
end
