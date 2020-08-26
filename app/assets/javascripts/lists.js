${function(){
  $("input.toggle").con("change", function(){
    $(this).parents("form").trigger('submit')
  })
}};