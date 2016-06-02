var events = angular.module("Bakery-Email-List", []);

bakeryEmailList.controller("SubscribersController",["$scope","$http",function($scope, $http){

    $http.get('/api/email_subscribers').then(function(response){
      $scope.email_subscribers = response.data.email_subscribers;
    })

    $scope.saveEmail = function(newEmail){
      $http.post('/api/email_subscribers', newEmail).then(function(response){
        console.log(response);
      })
    }

    $scope.makeEmail = function(email,zip){
      var newEmail = {
          email_subscriber: {
            email: email,
            zipcode: zip
          }
        }
      console.log(newEmail);
      $scope.saveEmail(newEmail)
      $scope.emailInput = "";
      $scope.zipcodeInput = "";
    }


}])
