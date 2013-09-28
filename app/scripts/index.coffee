app = angular.module("sungood", [])

app.filter 'filename', () ->
  (input) -> input.toLowerCase().replace(/\W/gi,"_")

app.controller "BookCtrl", ($scope) ->
  $scope.books = [
    {name:'101 Design Methods', code:'a', group:"INNOVATION", x:0, y:0}
    {name:'Communicating The New', code:'b', group:"INNOVATION", x:0, y:0}
    {name:'Design Thinking for Strategic Innovation', code:'c', group:"INNOVATION", x:0, y:0}
    {name:'Sketching User Experiences', code:'e', group:"UX", x:0, y:0}
    {name:'This is Service Design Thinking', code:'f', group:"UX", x:0, y:0}
    {name:'The UX Book', code:'g', group:"UX", x:0, y:0}
    {name:'Observing the User Experience', code:'h', group:"UX", x:0, y:0}
    {name:'Agile User Experience Design', code:'i', group:"UX", x:0, y:0}
    {name:'Designing the Search Experience', code:'j', group:"UX", x:0, y:0}
    {name:'Experience Design', fullname:'Experience Design: A Framework for Integrating Brand, Experience, and Value', code:'k', group:"UX", x:0, y:0}
    {name:'It\'s Our Research', fullname:'It\'s Our Research: Getting Stakeholder Buy-in for User Experience Research Projects', code:'l', group:"UX", x:0, y:0}
    {name:'Usability Testing Essentials', fullname:'Usability Testing Essentials: Ready, Set...Test!', code:'m', group:"UX", x:0, y:0}
    {name:'Measuring the User Experience', fullname:'Measuring the User Experience, Second Edition: Collecting, Analyzing, and Presenting Usability Metrics (Interactive Technologies)', code:'n', group:"UX", x:0, y:0}
    {name:'Quantifying the User Experience', fullname:'Quantifying the User Experience: Practical Statistics for User Research', code:'o', group:"UX", x:0, y:0}
    {name:'User Experience Management', fullname:'User Experience Management: Essential Skills for Leading Effective UX Teams', code:'p', group:"UX", x:0, y:0}
    {name:'Managing Data in Motion', code:'d', group:"INFORMATION DESIGN", x:0, y:0}
    {name:'Pervasive Information Architecture', fullname:'Pervasive Information Architecture: Designing Cross-Channel User Experiences', code:'d', group:"INFORMATION DESIGN", x:0, y:0}
    {name:'Visualize This', fullname:'Visualize This: The FlowingData Guide to Design, Visualization, and Statistics', code:'d', group:"INFORMATION DESIGN", x:0, y:0}
    {name:'A Touch of Code', fullname:'A Touch of Code: Interactive Installations and Experiences', code:'d', group:"INTERACTION DESIGN", x:0, y:0}
    {name:'Human-Computer Interaction', fullname:'Human-Computer Interaction: An Empirical Research Perspective', code:'d', group:"INTERACTION DESIGN", x:0, y:0}
    {name:'ART+COM', fullname:'ART+COM: Media Spaces and Installations', code:'d', group:"INTERACTION DESIGN", x:0, y:0}
    {name:'Brave NUI World', fullname:'Brave NUI World: Designing Natural User Interfaces for Touch and Gesture', code:'d', group:"INTERACTION DESIGN", x:0, y:0}
    {name:'UI is Communication', fullname:'UI is Communication: How to Design Intuitive, User Centered Interfaces by Focusing on Effective Communication', code:'d', group:"INTERACTION DESIGN", x:0, y:0}
  ]

  # (listener_width = ()->
  #   width = $(window).width() - 200 - 5
  #   if width isnt $scope.main_width
  #     $scope.main_width = width
  #     $scope.$apply() unless $scope.$$phase
  #   setTimeout listener_width, 1000
  # )()