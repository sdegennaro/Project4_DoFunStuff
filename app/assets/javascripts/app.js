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
      var newEvent = {
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

    $scope.logIds = function($event){
      var eventId = parseInt($(this)[0].event.id)
      var userId = ""
      newFave =
      $http.get('/api/favorites').then(function(response){
        userId = parseInt(response.data.user.id);
        var newFave = {
            fave: {
              event_id: eventId,
              user_id: userId
            }
          }
          console.log(newFave);
        $scope.saveFave(newFave)
      })
    }

    $scope.saveFave = function(newFave){
      $http.post('/api/favorites', newFave).then(function(response){
        console.log(response);
      })
    }
    $http.get('/users/find').then(function(response){
      $scope.users = response.data;
      console.log("here's the stuff ", $scope.users);
    })



}])
