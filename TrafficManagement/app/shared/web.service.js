
(function () {
    'use strict';
    function webService(webEndPoint, serviceRepository, $http) {
        var config = {};
        function getRouteStarts() {
            var arr = 'route/GetStarts'; 
            return serviceRepository.get([webEndPoint.baseUrl, arr].join(''), config);
        }
        function getRouteEnds() {
            var arr = 'route/GetEnds'; 
            return serviceRepository.get([webEndPoint.baseUrl, arr].join(''), config);
        }
        function calculateRoute(idStart, idEnd) {
            var arr = 'calculate/calculateRoute';
            return serviceRepository.get([webEndPoint.baseUrl,arr,'/' +idStart+'/' +idEnd +'/'].join(''), config);
        }
        var service = {
            getRouteStarts: getRouteStarts,
            getRouteEnds: getRouteEnds,
            calculateRoute: calculateRoute
        }
        return service;
    }
    angular.module('app.shared').factory('webService', webService);
    webService.$inject = ['webEndPoint', 'serviceRepository', '$http'];
}());