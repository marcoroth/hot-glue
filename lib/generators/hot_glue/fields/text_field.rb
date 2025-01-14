class TextField < Field
  def spec_random_data
    FFaker::AnimalUS.common_name
  end

  def spec_setup_and_change_act(which_partial = nil)
    "      " + "new_#{name} = FFaker::Lorem.paragraphs(1).join("") \n" +
    "      find(\"[name='#{testing_name}[#{ name.to_s }]']\").fill_in(with: new_#{name.to_s})"
  end

  def spec_setup_let_arg
    "#{name}:  FFaker::Lorem.paragraphs(10).join("  ")"
  end

  def form_field_output
    if sql_type == "varchar" || sql_type == "character varying"
      field_output( nil, limit || 40)
    else
      text_area_output( 65536, extra_classes: (modify_as == {tinymce: 1} ? " tinymce" : "" ))
    end
  end

  # TODO: dry with string_field.rb
  def text_result( sql_type, limit)
    if sql_type == "varchar"
      field_output( nil, limit)
    else
      text_area_output( 65536)
    end
  end
end
