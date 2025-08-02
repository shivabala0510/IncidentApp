sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'incfioriapp/test/integration/FirstJourney',
		'incfioriapp/test/integration/pages/IncidentsList',
		'incfioriapp/test/integration/pages/IncidentsObjectPage',
		'incfioriapp/test/integration/pages/Incidents_conversationObjectPage'
    ],
    function(JourneyRunner, opaJourney, IncidentsList, IncidentsObjectPage, Incidents_conversationObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('incfioriapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheIncidentsList: IncidentsList,
					onTheIncidentsObjectPage: IncidentsObjectPage,
					onTheIncidents_conversationObjectPage: Incidents_conversationObjectPage
                }
            },
            opaJourney.run
        );
    }
);