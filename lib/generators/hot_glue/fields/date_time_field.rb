class DateTimeField < Field
  def spec_random_data
    Time.now + rand(1..5).days
  end

  def spec_setup_and_change_act(which_partial = nil)
    "      " + "new_#{name} = DateTime.current + (rand(100).days) \n" +
    '      ' + "find(\"[name='#{testing_name}[#{ name.to_s }]']\").fill_in(with: new_#{name.to_s})"

  end

  def spec_make_assertion
    if !modify_binary?
      "expect(page).to have_content(new_#{name}.in_time_zone(current_timezone).strftime('%m/%d/%Y @ %l:%M %p ') + timezonize(current_timezone))"
    else
      "expect(page).to have_content('#{modify[:binary][:truthy]}'"
    end
  end

  def spec_setup_let_arg
    "#{name}: DateTime.current + rand(1000).seconds"
  end

  def spec_list_view_assertion
    if modify_binary?
      "expect(page).to have_content('#{modify[:binary][:truthy]}')"
    else
      spec_list_view_natural_assertion
    end
  end

  def spec_list_view_natural_assertion
    "expect(page).to have_content(#{singular}#{1}.#{name}.in_time_zone(current_timezone).strftime('%m/%d/%Y @ %l:%M %p ').gsub(' ', ' ') + timezonize(current_timezone) )"
  end

  def form_field_output
    "<%= datetime_field_localized(f, :#{name}, #{singular}.#{name}, '#{ name.to_s.humanize }', #{auth ? auth+'.timezone' : 'nil'}) %>"
  end

  def line_field_output
    if modify_binary?
      modified_display_output
    else
      "<% unless #{singular}.#{name}.nil? %>
  <%= #{singular}.#{name}.in_time_zone(current_timezone).strftime('%m/%d/%Y @ %l:%M %p ') + timezonize(current_timezone) %>
  <% else %>
  <span class='alert-danger'>MISSING</span>
  <% end %>"
    end
  end
end
