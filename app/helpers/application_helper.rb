module ApplicationHelper

  def link_to_add_fields(name, f, association, options={})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#',
            class: "add_fields btn btn-primary btn-sm btn-xs #{options[:class]}",
            data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, '_remove_fields(this)', class: 'remove_fields btn btn-xs btn-danger')
  end

  def link_to_remove_fields_nested(name, f)
    f.hidden_field(:_destroy) + link_to(name, '_remove_fields_nested(this)', class: 'remove_fields_nested btn btn-xs btn-danger')
  end

  def link_to_remove_tr(name, f)
    f.hidden_field(:_destroy) + link_to(name, '_remove_tr(this)', class: 'remove_tr btn btn-xs btn-danger')
  end

end
