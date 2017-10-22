
(function () {
    'use strict';

    function ctrlDocumentType( $rootScope, $location, webService, $timeout) {
        var vm = this;

        function activate() {
            getDocumentTypeData();
            
        }
        
        function getDocumentTypeData() {
            vm.promise = webService.getDocTypeData();
            vm.promise.then(function (response) {
                if (response.Status === 0) {
                    console.log("Server error");
                    //Туке се хендла еррор значи дека на сервер нешто се случило 
                }
                vm.crossroadList = response.crossroadList;
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
            promise: null,
            selectedCrossroad: null,
            crossroadList: [],
    });
        //
        activate();
    }

    angular.module('app').controller('ctrlDocumentType', ctrlDocumentType);
    ctrlDocumentType.$inject = [ '$rootScope', '$location', 'webService', '$timeout'];
})()