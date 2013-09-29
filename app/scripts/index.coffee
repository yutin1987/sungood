app = angular.module("sungood", [])

app.filter 'filename', () ->
  (input) -> input.toLowerCase().replace(/\W/gi,"_")

app.controller "BookCtrl", ($scope) ->
  $scope.status = undefined
  $scope.books = [
    {code:'a', name:'101 Design Methods', group:"INNOVATION"}
    {code:'b', name:'Communicating The New', group:"INNOVATION"}
    {code:'c', name:'Design Thinking for Strategic Innovation', group:"INNOVATION"}
    {code:'h', name:'Observing the User Experience', group:"UX"}
    {code:'e', name:'Analyzing the Social Web', group:"UX"}
    {code:'e', name:'Sketching User Experiences', group:"UX"}
    {code:'f', name:'This is Service Design Thinking', group:"UX"}
    {code:'g', name:'The UX Book', group:"UX"}
    {code:'g', name:'Writing for Interaction', group:"UX"}
    {code:'g', name:'Mobile User Experience', fullname:'Mobile User Experience: Patterns to Make Sense of it All', group:"UX"}
    {code:'i', name:'Agile User Experience Design', group:"UX"}
    {code:'j', name:'Designing the Search Experience', group:"UX"}
    {code:'k', name:'Experience Design', fullname:'Experience Design: A Framework for Integrating Brand, Experience, and Value', group:"UX"}
    {code:'l', name:'It\'s Our Research', fullname:'It\'s Our Research: Getting Stakeholder Buy-in for User Experience Research Projects', group:"UX"}
    {code:'m', name:'Usability Testing Essentials', fullname:'Usability Testing Essentials: Ready, Set...Test!', group:"UX"}
    {code:'n', name:'Measuring the User Experience', fullname:'Measuring the User Experience, Second Edition: Collecting, Analyzing, and Presenting Usability Metrics (Interactive Technologies)', group:"UX"}
    {code:'o', name:'Quantifying the User Experience', fullname:'Quantifying the User Experience: Practical Statistics for User Research', group:"UX"}
    {code:'p', name:'User Experience Management', fullname:'User Experience Management: Essential Skills for Leading Effective UX Teams', group:"UX"}
    {code:'d', name:'Managing Data in Motion', group:"INFORMATION DESIGN"}
    {code:'d', name:'Pervasive Information Architecture', fullname:'Pervasive Information Architecture: Designing Cross-Channel User Experiences', group:"INFORMATION DESIGN"}
    {code:'d', name:'Visualize This', fullname:'Visualize This: The FlowingData Guide to Design, Visualization, and Statistics', group:"INFORMATION DESIGN"}
    {code:'d', name:'A Touch of Code', fullname:'A Touch of Code: Interactive Installations and Experiences', group:"INTERACTION DESIGN"}
    {code:'d', name:'Human-Computer Interaction', fullname:'Human-Computer Interaction: An Empirical Research Perspective', group:"INTERACTION DESIGN"}
    {code:'d', name:'ART+COM', fullname:'ART+COM: Media Spaces and Installations', group:"INTERACTION DESIGN"}
    {code:'d', name:'Brave NUI World', fullname:'Brave NUI World: Designing Natural User Interfaces for Touch and Gesture', group:"INTERACTION DESIGN"}
    {code:'d', name:'UI is Communication', fullname:'UI is Communication: How to Design Intuitive, User Centered Interfaces by Focusing on Effective Communication', group:"INTERACTION DESIGN"}
  ]

  $scope.want = (book) ->
    console.log book.status
    if book.status is 'want'
      book.status = undefined
    else
      book.status = 'want'

  $scope.push = (book) ->
    console.log book.status
    if book.status is 'push'
      book.status = undefined
    else
      book.status = 'push'

  # (listener_width = ()->
  #   width = $(window).width() - 200 - 5
  #   if width isnt $scope.main_width
  #     $scope.main_width = width
  #     $scope.$apply() unless $scope.$$phase
  #   setTimeout listener_width, 1000
  # )()