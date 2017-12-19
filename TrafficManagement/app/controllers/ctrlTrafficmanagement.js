
(function () {
    'use strict';

    function ctrlTrafficManagement($rootScope, $location, webService, $timeout) {
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
                }
                vm.routeStarts = response
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
                }
                vm.routeEnds = response
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
            vm.promise = webService.calculateRoute(idStart, idEnd);
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
            });

        }

        angular.extend(vm, {
            routeStarts: [],
            routeEnds: [],
            calculateRoute: calculateRoute,

        });
        //
        activate();
    }

    angular.module('app').controller('ctrlTrafficManagement', ctrlTrafficManagement);
    ctrlTrafficManagement.$inject = ['$rootScope', '$location', 'webService', '$timeout'];
})();