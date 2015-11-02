class RecipeImgInput < SimpleForm::Inputs::FileInput
def input
  out = '' # the output string we're going to build
  # check if there's an uploaded file (eg: edit mode or form not saved)
  if object.send("#{attribute_name}?")
    # append preview image to output
    # <%= image_tag @recipe.recipe_img.url(:thumb), class: 'img-responsive', id: 'recipe_img' %>
    out << template.image_tag(object.send(attribute_name).url, class:'img-responsive', id: 'recipe_img')
  end
    # append file input. it will work accordingly with your simple_form wrappers
    (out << @builder.file_field(attribute_name, input_html_options)).html_safe
  end
end