var app;

$(function() {
  return $('.line-top, .line-bottom').append('<div class="box-a" />', '<div class="box-b" />');
});

app = angular.module("sungood", []);

app.filter('filename', function() {
  return function(input) {
    return input.toLowerCase().replace(/\W/gi, "_");
  };
});

app.controller("BookCtrl", function($scope) {
  var updae_hash;
  $scope.name = '';
  $scope.editName = true;
  $scope.share_link = location.href;
  $scope.books = [
    {
      code: 'a',
      name: '101 Design Methods',
      group: "INNOVATION"
    }, {
      code: 'b',
      name: 'Communicating The New',
      group: "INNOVATION"
    }, {
      code: 'c',
      name: 'Design Thinking for Strategic Innovation',
      group: "INNOVATION"
    }, {
      code: 'd',
      name: 'Observing the User Experience',
      group: "UX"
    }, {
      code: 'e',
      name: 'Analyzing the Social Web',
      group: "UX"
    }, {
      code: 'f',
      name: 'Sketching User Experiences',
      group: "UX"
    }, {
      code: 'g',
      name: 'This is Service Design Thinking',
      group: "UX"
    }, {
      code: 'h',
      name: 'The UX Book',
      group: "UX"
    }, {
      code: 'i',
      name: 'Writing for Interaction',
      group: "UX"
    }, {
      code: 'j',
      name: 'Mobile User Experience',
      fullname: 'Mobile User Experience: Patterns to Make Sense of it All',
      group: "UX"
    }, {
      code: 'k',
      name: 'Agile User Experience Design',
      group: "UX"
    }, {
      code: 'l',
      name: 'Designing the Search Experience',
      group: "UX"
    }, {
      code: 'm',
      name: 'Experience Design',
      fullname: 'Experience Design: A Framework for Integrating Brand, Experience, and Value',
      group: "UX"
    }, {
      code: 'n',
      name: 'It\'s Our Research',
      fullname: 'It\'s Our Research: Getting Stakeholder Buy-in for User Experience Research Projects',
      group: "UX"
    }, {
      code: 'o',
      name: 'Usability Testing Essentials',
      fullname: 'Usability Testing Essentials: Ready, Set...Test!',
      group: "UX"
    }, {
      code: 'p',
      name: 'Measuring the User Experience',
      fullname: 'Measuring the User Experience, Second Edition: Collecting, Analyzing, and Presenting Usability Metrics (Interactive Technologies)',
      group: "UX"
    }, {
      code: 'q',
      name: 'Quantifying the User Experience',
      fullname: 'Quantifying the User Experience: Practical Statistics for User Research',
      group: "UX"
    }, {
      code: 'r',
      name: 'User Experience Management',
      fullname: 'User Experience Management: Essential Skills for Leading Effective UX Teams',
      group: "UX"
    }, {
      code: 's',
      name: 'Managing Data in Motion',
      group: "INFORMATION DESIGN"
    }, {
      code: 't',
      name: 'Pervasive Information Architecture',
      fullname: 'Pervasive Information Architecture: Designing Cross-Channel User Experiences',
      group: "INFORMATION DESIGN"
    }, {
      code: 'u',
      name: 'Visualize This',
      fullname: 'Visualize This: The FlowingData Guide to Design, Visualization, and Statistics',
      group: "INFORMATION DESIGN"
    }, {
      code: 'v',
      name: 'A Touch of Code',
      fullname: 'A Touch of Code: Interactive Installations and Experiences',
      group: "INTERACTION DESIGN"
    }, {
      code: 'w',
      name: 'Human-Computer Interaction',
      fullname: 'Human-Computer Interaction: An Empirical Research Perspective',
      group: "INTERACTION DESIGN"
    }, {
      code: 'x',
      name: 'ART+COM',
      fullname: 'ART+COM: Media Spaces and Installations',
      group: "INTERACTION DESIGN"
    }, {
      code: 'y',
      name: 'Brave NUI World',
      fullname: 'Brave NUI World: Designing Natural User Interfaces for Touch and Gesture',
      group: "INTERACTION DESIGN"
    }, {
      code: 'z',
      name: 'UI is Communication',
      fullname: 'UI is Communication: How to Design Intuitive, User Centered Interfaces by Focusing on Effective Communication',
      group: "INTERACTION DESIGN"
    }
  ];
  (function() {
    var book, hash;
    hash = decodeURIComponent(location.hash).split('_');
    book = hash[0].match(/[a-z][0-9]/gi);
    $scope.name = hash[1] || '';
    $scope.editName = $scope.name ? false : true;
    angular.forEach(book, function(value, key) {
      var item, _i, _len, _ref, _results;
      _ref = $scope.books;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        if (item.code === value[0]) {
          switch (value[1]) {
            case '1':
              item.is_push = true;
              break;
            case '2':
              item.is_want = true;
              break;
            case '3':
              item.is_push = true;
              item.is_want = true;
          }
          break;
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    });
    return ga('send', 'event', 'transform', decodeURIComponent(location.hash));
  })();
  $scope.enter = function() {
    $scope.editName = false;
    ga('send', 'event', 'edit', 'OFF');
    if (!$scope.name) {
      $scope.name = 'No Name';
    }
    return location.hash = location.hash.split('_')[0] + '_' + $scope.name;
  };
  $scope.edit = function() {
    ga('send', 'event', 'edit', 'ON');
    return $scope.editName = true;
  };
  $scope.share = function() {
    return ga('send', 'event', 'share', location.href);
  };
  $scope.clear = function() {
    var item, _i, _len, _ref;
    $scope.name = '';
    _ref = $scope.books;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      item = _ref[_i];
      item.is_push = false;
      item.is_want = false;
    }
    location.hash = '';
    return $scope.editName = true;
  };
  updae_hash = function(book) {
    var avg, code, name, reg, value;
    code = book.code;
    value = 0;
    if (book.is_push) {
      value += 1;
    }
    if (book.is_want) {
      value += 2;
    }
    avg = location.hash.split('_');
    reg = new RegExp(code + '[0-9]?', 'gi');
    book = avg[0] || '';
    if (book.search(reg) < 0 && value > 0) {
      book = book + code + value;
    }
    book = book.replace(reg, value > 0 ? code + value : '');
    name = avg[1] || '';
    location.hash = book + '_' + name;
    return $scope.share_link = encodeURIComponent(location.href);
  };
  $scope.want = function(book) {
    book.is_want = !book.is_want;
    ga('send', 'event', 'want', book.name, book.book ? 'YES' : 'NO');
    return updae_hash(book);
  };
  return $scope.push = function(book) {
    book.is_push = !book.is_push;
    ga('send', 'event', 'push', book.name, book.is_push ? 'YES' : 'NO');
    return updae_hash(book);
  };
});

/*
//@ sourceMappingURL=index.js.map
*/