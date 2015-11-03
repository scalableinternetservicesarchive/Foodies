class StepImgInput < SimpleForm::Inputs::FileInput
def input
  out = '' # the output string we're going to build
  # check if there's an uploaded file (eg: edit mode or form not saved)
  # if object.send("#{attribute_name}?")
    # append preview image to output
    # <%= image_tag @step.step_img.url(:square), class: 'img-responsive', id: 'recipe_img' %>
    out << template.image_tag(object.send(attribute_name).url(:square), class:'img-responsive', id: 'step_img')
  # end
    # append file input. it will work accordingly with your simple_form wrappers
    (out << @builder.file_field(attribute_name, input_html_options)).html_safe
  end
end