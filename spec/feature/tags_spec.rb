feature 'creating links' do

  scenario 'I can add the tag with new bookmark entry' do
    visit '/links/new'
    fill_in 'title', with: 'disneyland'
    fill_in 'url', with: 'https://disneyland.com/'
    fill_in 'tag', with: 'entertainment'
    click_on 'Create link'
    expect(current_path).to eq('/links')
    within 'ul.links' do
      expect(page).to have_content('entertainment')
    end
  end

end
