class Field
  attr_accessor :assoc_model, :assoc_name, :assoc_class, :associations, :alt_lookups, :auth,
                :assoc_label,  :class_name,  :form_placeholder_labels, :form_labels_position,
                :hawk_keys,   :layout_strategy, :limit, :modify, :name, :object, :sample_file_path,
                :singular_class,  :singular, :sql_type, :ownership_field,
                :update_show_only

  def initialize(
    auth: ,
    alt_lookups: ,
    attachment_data: nil,
    class_name: ,
    form_labels_position:,
    form_placeholder_labels: ,
    hawk_keys: nil,
    layout_strategy:  ,
    modify: ,
    name: ,
    ownership_field: ,
    sample_file_path: nil,
    singular: ,
    update_show_only:
  )
    @name = name
    @layout_strategy = layout_strategy
    @alt_lookups = alt_lookups
    @singular = singular
    @class_name = class_name
    @update_show_only = update_show_only
    @hawk_keys = hawk_keys
    @auth = auth
    @sample_file_path = sample_file_path
    @form_placeholder_labels = form_placeholder_labels
    @ownership_field = ownership_field
    @form_labels_position = form_labels_position
    @modify = modify

    # TODO: remove knowledge of subclasses from Field
    unless self.class == AttachmentField
      @sql_type = eval("#{class_name}.columns_hash['#{name}']").sql_type
      @limit = eval("#{class_name}.columns_hash['#{name}']").limit
    end
  end

  def getName
    @name
  end

  def field_error_name
    name
  end

  def spec_random_data

  end

  def testing_name
    class_name.to_s.gsub("::","_").underscore
  end

  def spec_setup_and_change_act(which_partial = nil)
    ""
  end


  def spec_make_assertion
    if !modify_binary?
      "expect(page).to have_content(new_#{name})"
    else
      "expect(page).to have_content('#{modify[:binary][:truthy]}'"
    end
  end


  def spec_setup_let_arg

  end

  def spec_list_view_natural_assertion
    "expect(page).to have_content(#{singular}#{1}.#{name})"
  end

  def spec_list_view_assertion
    if modify_binary?
      "expect(page).to have_content('#{modify[:binary][:truthy]}'"
    else
      spec_list_view_natural_assertion
    end
  end


  def spec_related_column_lets
    ""
  end

  def line_field_output
    viewable_output
  end

  def form_show_only_output
    viewable_output
  end

  def viewable_output
    if modify
      modified_display_output
    else
      "<%= #{singular}.#{name} %>"
    end
  end

  def modified_display_output
    if  modify[:cast] && modify[:cast] == "$"
      "<%= number_to_currency(#{singular}.#{name}) %>"
    elsif modify[:binary]
      "<%= #{singular}.#{name} ? '#{modify[:binary][:truthy]}' : '#{modify[:binary][:falsy]}' %>"
    end
  end

  def field_output(type = nil, width )
    "  <%= f.text_field :#{name}, value: #{singular}.#{name}, autocomplete: 'off', size: #{width}, class: 'form-control', type: '#{type}'"  + (form_placeholder_labels ? ", placeholder: '#{name.to_s.humanize}'" : "")  +  " %>\n " + "\n"
  end

  def text_area_output(field_length )
    lines = field_length % 40
    if lines > 5
      lines = 5
    end
    "<%= f.text_area :#{name}, class: 'form-control', autocomplete: 'off', cols: 40, rows: '#{lines}'"  + ( form_placeholder_labels ? ", placeholder: '#{name.to_s.humanize}'" : "") + " %>"
  end

  def modify_binary? # safe
    !!(modify && modify[:binary])
  end
end
