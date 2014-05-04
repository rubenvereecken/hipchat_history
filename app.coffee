# HipChat API token
token = ''



$(->
  options =
    valueNames: ['user', 'message_content']
    plugins: [ ListFuzzySearch() ]
  t = new List 'thread', options

  ('#searchbox').on 'change', (e) ->
    terms = ('#searchbox').value()
    t.fuzzySearch.search(terms)
)



fetchRooms = (callback) ->
  $.ajax('https://api.hipchat.com/v1/rooms/list',
    async: false,
    success: callback
  )