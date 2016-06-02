var eventApi = angular.module("Event-Api", []);

eventApi.controller("EventApiController",["$scope","$http",function($scope, $http){

    $http.get('/api/events').then(function(response){
      $scope.events = response.data.events;
    })

    $scope.saveEvent = function(newEvent){
      $http.post('/api/events', newEvent).then(function(response){
        console.log(response);
      })
    }

    $scope.makeEvent = function(date, time, title, description, location, url, image_url){
      var newEmail = {
          eventObject: {
            date: date,
            time: time,
            title: title,
            description: description,
            location: location,
            url: url,
            image_url: image_url
          }
        }
      console.log(newEvent);
      $scope.saveEvent(newEvent)
    //   $scope.emailInput = "";
    //   $scope.zipcodeInput = "";
    }


}])
