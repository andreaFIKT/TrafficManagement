
(function () {
    'use strict';
    function webService(webEndPoint, serviceRepository, $http) {
        var config = {};
        function getData() {
            var arr = 'името-на-контролерот/акцијата'; //currency/GetData;
            return serviceRepository.get([webEndPoint.baseUrl, arr].join(''), config);
        }
        function getRouteStarts() {
            var arr = 'route/GetStarts'; //currency/GetData;
            return serviceRepository.get([webEndPoint.baseUrl, arr].join(''), config);
        }
        function getRouteEnds() {
            var arr = 'route/GetEnds'; //currency/GetData;
            return serviceRepository.get([webEndPoint.baseUrl, arr].join(''), config);
        }
        function calculateRoute(idStart, idEnd) {
            var arr = 'calculate/calculateRoute';
            return serviceRepository.get([webEndPoint.baseUrl, arr,'?Id_start=' + idStart +'&Id_end=' + idEnd].join(''), config);
        }
        var service = {
            getData: getData,
            getRouteStarts: getRouteStarts,
            getRouteEnds: getRouteEnds,
            calculateRoute: calculateRoute
        }
        return service;
    }
    angular.module('app.shared').factory('webService', webService);
    webService.$inject = ['webEndPoint', 'serviceRepository', '$http'];
}());