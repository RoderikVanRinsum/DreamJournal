require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout links' do
    get root_path
    assert_template 'dreams/index'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", dreamsigns_path
  end
end
