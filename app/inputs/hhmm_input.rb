class HhmmInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    hour, minute = options[:selected].split(':')
    @builder.select("#{attribute_name}(1)", '00'..'23', {selected: hour}, wrapper_options) + 
    @builder.select("#{attribute_name}(2)", ('00'..'59').step(30).to_a, {selected: minute}, wrapper_options)
  end
end