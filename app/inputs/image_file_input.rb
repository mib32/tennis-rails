class ImageFileInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options)
    version = options.delete(:version) || :small
    out = ''

    image_path = object.send(attribute_name).send(version)
    if image_path.present?
      image = template.image_tag(image_path)
      out << template.content_tag(:div, image) 
    end
    out << super
    out.html_safe
  end
end