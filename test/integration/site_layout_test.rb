require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test 'layout links' do
    get root_path
    assert_template 'dreams/index'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", dreamsigns_path
  end

  test 'layout elements' do
    get root_path
    assert_select "a#logo"
    assert_select "section.main-content"
    assert_select "aside.search-sidebar"
  end

end
