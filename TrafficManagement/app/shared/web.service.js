
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
        function getLatitudes() {
            var arr = 'crossroad/GetLats';
            return serviceRepository.get([webEndPoint.baseUrl, arr].join(''), config);
        }
        function getLongitudes() {
            var arr = 'crossroad/GetLongs';
            return serviceRepository.get([webEndPoint.baseUrl, arr].join(''), config);
        }
        function getCoords(Latitude, Longitude) {
            var arr = 'crossroad/GetCoords';
            return serviceRepository.get([webEndPoint.baseUrl, arr, '/'+Latitude +'/'+Longitude +'/'].join(''), config);
        }
        var service = {
            getRouteStarts: getRouteStarts,
            getRouteEnds: getRouteEnds,
            calculateRoute: calculateRoute,
            getLatitudes: getLatitudes,
            getLongitudes : getLongitudes,
            getCoords : getCoords
        }
        return service;
    }
    angular.module('app.shared').factory('webService', webService);
    webService.$inject = ['webEndPoint', 'serviceRepository', '$http'];
}());