sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ust/srija/purchaseorderapp2/test/integration/FirstJourney',
		'ust/srija/purchaseorderapp2/test/integration/pages/POsList',
		'ust/srija/purchaseorderapp2/test/integration/pages/POsObjectPage',
		'ust/srija/purchaseorderapp2/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ust/srija/purchaseorderapp2') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);