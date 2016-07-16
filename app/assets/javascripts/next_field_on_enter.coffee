next_field = ->
  $('#inputform').on('keydown', 'input', (e)->
    if e.which == 13
      console.log(e.which)
      e.preventDefault()
#      $this = $(e.target)
      console.log(@.id)
#      console.log($this.attr('dataindex'))
#      index = parseFloat($this.attr('dataindex'))
      console.log($(@).attr('dataindex'))
      index = parseFloat($(@).attr('dataindex'))
      console.log(index)
      $('[dataindex="' + (index + 1).toString() + '"]').focus()
  )

$ (->
  next_field()
)