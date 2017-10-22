
(function () {
    'use strict';

    function ctrlDocumentType($rootScope, $location,$http, webService, $timeout) {
        var vm = this;

        function activate() {
            getRouteStarts();
            getRouteEnds();

        }

        function getRouteStarts() {
            vm.promise = webService.getRouteStarts();
            vm.promise.then(function (response) {
                if (response.Status === 0) {
                    console.log("Server error");
                    //Туке се хендла еррор значи дека на сервер нешто се случило 
                }
                vm.routeStarts = response//.routeList;
            }, function () {
                $timeout(function () {
                    ngToast.create({
                        className: 'danger',
                        content: $translate.instant('RequestFailed')
                    });
                }, 0);
            });
        }
        function getRouteEnds() {
            vm.promise = webService.getRouteEnds();
            vm.promise.then(function (response) {
                if (response.Status === 0) {
                    console.log("Server error");
                    //Туке се хендла еррор значи дека на сервер нешто се случило 
                }
                vm.routeEnds = response//.routeList;
            }, function () {
                $timeout(function () {
                    ngToast.create({
                        className: 'danger',
                        content: $translate.instant('RequestFailed')
                    });
                }, 0);
            });
        }

        function calculateRoute(idStart, idEnd) {
            var data = {
                "Id_start": idStart,
                "Id_end": idEnd
            }
            var req = {
                method: "POST",
                url: 'http://localhost:50850/api/calculate/calculateRoute/',
                data:data
            };

            return $http(req)
  .success(function (data, status) {
      $scope.properties.dataFromSuccess = data;//here data can contain whether the form is valid or invalid...so create a boolean at server if it's valid or not..
      if ($scope.properties.dataFromSuccess.isSuccess) {
          $http.post(URL, formData).success(function (data) {
              $scope.dataSaved = data;
          });
      } else {
          $scope.properties.dataFromError = data; //set the errors in the scope to display
      }

  })
  .error(function (data, status) { //this error means request has been failed to process not the validation error we are checking at server..
      //$scope.properties.dataFromError = data;

  })
  .finally(function () {

  });

            /*vm.promise = webService.calculateRoute(idStart, idEnd);
            vm.promise.then(function (response) {
                if (response.Status === 0) {
                    console.log("Server error");
                }
                vm.route = response;
            }, function () {
                $timeout(function () {
                    ngToast.create({
                        className: 'danger',
                        content: $translate.instant('RequestFailed')
                    });
                }, 0);
            });*/

        }

        angular.extend(vm, {
            routeStarts: [],
            routeEnds: [],
            calculateRoute: calculateRoute               
        });
        //
        activate();
    }

    angular.module('app').controller('ctrlDocumentType', ctrlDocumentType);
    ctrlDocumentType.$inject = ['$rootScope', '$location', '$http','webService', '$timeout'];
})();