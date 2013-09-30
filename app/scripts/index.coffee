$ ->
  $('.line-top, .line-bottom').append '<div class="box-a" />', '<div class="box-b" />'

app = angular.module("sungood", [])

app.filter 'filename', () ->
  (input) -> input.toLowerCase().replace(/\W/gi,"_")

app.controller "BookCtrl", ($scope) ->
  $scope.name = ''
  $scope.editName = on
  $scope.share_link = location.href
  $scope.books = [
    {code:'a', name:'101 Design Methods', group:"INNOVATION"}
    {code:'b', name:'Communicating The New', group:"INNOVATION"}
    {code:'c', name:'Design Thinking for Strategic Innovation', group:"INNOVATION"}
    {code:'d', name:'Observing the User Experience', group:"UX"}
    {code:'e', name:'Analyzing the Social Web', group:"UX"}
    {code:'f', name:'Sketching User Experiences', group:"UX"}
    {code:'g', name:'This is Service Design Thinking', group:"UX"}
    {code:'h', name:'The UX Book', group:"UX"}
    {code:'i', name:'Writing for Interaction', group:"UX"}
    {code:'j', name:'Mobile User Experience', fullname:'Mobile User Experience: Patterns to Make Sense of it All', group:"UX"}
    {code:'k', name:'Agile User Experience Design', group:"UX"}
    {code:'l', name:'Designing the Search Experience', group:"UX"}
    {code:'m', name:'Experience Design', fullname:'Experience Design: A Framework for Integrating Brand, Experience, and Value', group:"UX"}
    {code:'n', name:'It\'s Our Research', fullname:'It\'s Our Research: Getting Stakeholder Buy-in for User Experience Research Projects', group:"UX"}
    {code:'o', name:'Usability Testing Essentials', fullname:'Usability Testing Essentials: Ready, Set...Test!', group:"UX"}
    {code:'p', name:'Measuring the User Experience', fullname:'Measuring the User Experience, Second Edition: Collecting, Analyzing, and Presenting Usability Metrics (Interactive Technologies)', group:"UX"}
    {code:'q', name:'Quantifying the User Experience', fullname:'Quantifying the User Experience: Practical Statistics for User Research', group:"UX"}
    {code:'r', name:'User Experience Management', fullname:'User Experience Management: Essential Skills for Leading Effective UX Teams', group:"UX"}
    {code:'s', name:'Managing Data in Motion', group:"INFORMATION DESIGN"}
    {code:'t', name:'Pervasive Information Architecture', fullname:'Pervasive Information Architecture: Designing Cross-Channel User Experiences', group:"INFORMATION DESIGN"}
    {code:'u', name:'Visualize This', fullname:'Visualize This: The FlowingData Guide to Design, Visualization, and Statistics', group:"INFORMATION DESIGN"}
    {code:'v', name:'A Touch of Code', fullname:'A Touch of Code: Interactive Installations and Experiences', group:"INTERACTION DESIGN"}
    {code:'w', name:'Human-Computer Interaction', fullname:'Human-Computer Interaction: An Empirical Research Perspective', group:"INTERACTION DESIGN"}
    {code:'x', name:'ART+COM', fullname:'ART+COM: Media Spaces and Installations', group:"INTERACTION DESIGN"}
    {code:'y', name:'Brave NUI World', fullname:'Brave NUI World: Designing Natural User Interfaces for Touch and Gesture', group:"INTERACTION DESIGN"}
    {code:'z', name:'UI is Communication', fullname:'UI is Communication: How to Design Intuitive, User Centered Interfaces by Focusing on Effective Communication', group:"INTERACTION DESIGN"}
  ]

  (()->
    hash = decodeURIComponent(location.hash).split('_')
    book = hash[0].match(/[a-z][0-9]/gi)
    $scope.name = hash[1] || ''
    $scope.editName = if $scope.name then off else on
    angular.forEach book, (value, key) ->
      for item in $scope.books
        if item.code is value[0]
          switch value[1]
            when '1' then item.is_push = true
            when '2' then item.is_want = true
            when '3'
              item.is_push = true
              item.is_want = true
          break
    ga('send', 'event', 'transform', hash)
  )()

  $scope.enter = () ->
    $scope.editName = off
    ga('send', 'event', 'edit', 'OFF')
    $scope.name = 'No Name' unless $scope.name
    location.hash = location.hash.split('_')[0] + '_' + $scope.name

  $scope.edit = () ->
    ga('send', 'event', 'edit', 'ON')
    $scope.editName = on

  $scope.share = () ->
    ga('send', 'event', 'share', location.href)

  updae_hash = (book) ->
    code = book.code
    value = 0
    value += 1 if book.is_push
    value += 2 if book.is_want

    avg = location.hash.split('_')
    reg = new RegExp(code+'[0-9]?','gi')
    book = avg[0] || ''
    book = book+code+value if book.search(reg) < 0 and value > 0
    book = book.replace reg, if value > 0 then code+value else ''
    name = avg[1] || ''
    location.hash = book+'_'+name
    $scope.share_link = encodeURIComponent(location.href)

  $scope.want = (book) ->
    book.is_want = !book.is_want
    ga('send', 'event', 'want', if book.book then 'YES' else 'NO')
    updae_hash book

  $scope.push = (book) ->
    book.is_push = !book.is_push
    ga('send', 'event', 'push', if book.is_push then 'YES' else 'NO')
    updae_hash book

  # (listener_width = ()->
  #   width = $(window).width() - 200 - 5
  #   if width isnt $scope.main_width
  #     $scope.main_width = width
  #     $scope.$apply() unless $scope.$$phase
  #   setTimeout listener_width, 1000
  # )()