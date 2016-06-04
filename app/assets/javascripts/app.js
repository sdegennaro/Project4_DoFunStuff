var eventApi = angular.module("Event-Api", []);

eventApi.controller("EventApiController",["$scope","$http","$location",function($scope, $http, $location){

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

    $scope.getIdsforFave = function($event){
      var eventId = parseInt($(this)[0].event.id)
      var userId = ""
      $http.get('/api/favorites').then(function(response){
        userId = parseInt(response.data.user.id);
        var newFave = {
          favorite: {
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
      $scope.users = response.data.users;
    })

    $scope.getIdsforFriend = function($event){
      console.log($(this));
      var friendId = parseInt($(this)[0].user.id);

      var userId = "";
      $http.get('/api/friendships').then(function(response){
        userId = parseInt(response.data.user.id);
        var newFriend = {
          friend: {
          friend_id: friendId,
          user_id: userId
          }
        }
        var newFriendReverse = {
          friend: {
          friend_id: userId,
          user_id: friendId
          }
        }
        console.log(newFriend);
        $scope.saveFriend(newFriend)
        $scope.saveFriend(newFriendReverse)

      })
    }

    $scope.saveFriend = function(newFriend){
      $http.post('/api/friendships', newFriend).then(function(response){
        console.log(response);
      })
    };

    $scope.logOut = function(){
      $http.delete('/sessions').then(function(){
        console.log("logged out!");
      })
    };

    goToRoute = function ( element, path ) {
      element.on("click",function(){
        location.href="/users/new"
      });
    };

    $scope.getFaves = function(){
      console.log('yo');
      $http.get('/users/faves').then(function(response){
        $scope.myfaves = response.data.faves;
        console.log("here's the fave stuff ", $scope.myfaves);
      })
    }








    goToRoute($("#sign-up-button"),"/users/new")

}])

$(function(){
})
