feature 'adding tags' do
  scenario 'I can add a single tag with new bookmark entry' do
    visit '/links/new'
    fill_in 'title', with: 'disneyland'
    fill_in 'url', with: 'https://disneyland.com/'
    fill_in 'tag', with: 'entertainment'

    click_on 'Create link'
    link = Link.first
    expect(links.tags.map(&:name)).to include('entertainment')
    end
  end
end
