const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

const subscribe = (req, res, isDriver) => {
    const headers = {
        'Content-Type': 'text/event-stream',
        'Connection': 'keep-alive',
        'Cache-Control': 'no-cache',
    };
    res.writeHead(200, headers);

    const clientId = Date.now();

    const newClient = {
        id: clientId,
        isDriver,
        res
    };

    clients.push(newClient);
    // '\n' indicates end of event.
    res.write(`${JSON.stringify({id: clientId})}\n`);

    req.on('close', () => {
        console.log(`${clientId} Connection closed.`);
        clients = clients.filter(client => client.id !== clientId);
    });
    return newClient;
};

const boradcast = (data) => {
    clients.forEach(client =>client.res.write(`${data}\n`));
}

const sendMessage = (data, id) => {
    const target = clients.find((client) => client.id === id);
    target.res.write(`${data}\n`);
}

app.get('/status', (req, res) => {
    res.json({
        driver: clients.filter((client) => client.isDriver).length,
        passenger: clients.filter((client) => !client.isDriver).length,
    });
});

app.get('/api/subscribe', (req, res) => {
    console.log('Client subscribed');
    const client = subscribe(req, res, false);
    const data = {
        type: 'gift',
        content: 'Subscribed to server.'
    }
    sendMessage(JSON.stringify(data), client.id);
});

app.get('/api/register_driver/:id', (req, res) => {
    // Register client as driver.
    let client = clients.find((client) => client.id === parseInt(req.params.id));
    if (client) {
        console.log(`Register client ${client.id} as driver.`);
        client.isDriver = true;
        res.json({status: `Register ${client.id} as a driver.`});
    } else {
        console.log('Client not found.');//debug
    }
});

app.get('/api/request_drivers', (req, res) => {
    // Don't need to impl this yet.
    console.log('Request drivers.');
});

app.get('/api/choose_driver/:id', (req, res) => {
    // Pick the first driver from the clients. 
    const driver = clients.find((client) => client.isDriver);

    // Find the passenger.
    const passenger = clients.find((client) => client.id === parseInt(req.params.id));

    if (driver && passenger) {
        // Create a match.
        const match = {
            driverId: driver.id,
            passengerId: passenger.id,
            driverRating: -1,
            passengerRating: -1,
        }
        matches.push(match);
        console.log(`match created, passenger id: ${passenger.id}, driver id: ${driver.id}`);//debug
        res.json({status: `match created, passenger id: ${passenger.id}, driver id: ${driver.id}`});

        // Broadcast the match to driver and passenger.
        const passengerData = {
            type: 'driverMatched',
            content: 'We matched a driver for you.',
        };
        sendMessage(JSON.stringify(passengerData), passenger.id);
        const driverData = {
            type: 'passengerMatched',
            content: 'A passenger needs a ride.',
        }
        sendMessage(JSON.stringify(driverData), driver.id);
    } else {
        if (!passenger) {
            res.json({status: `Passenger ${req.params.id} does not exist.`});
            console.log(`Passenger ${req.params.id} does not exist.`);
        } else if (!driver) {
            res.json({status: 'No driver avaliable.'});
            console.log('No driver avaliable.');
        }
    }
}); 

app.get('/api/driver_location/:id', (req, res) => {
    // TODO: Driver post location.

    // Pick the first driver from the clients. 
    const driver = clients.find((client) => client.id === parseInt(req.params.id));
    const match = matches.find((match) => match.driverId === driver.id);
    const passenger = clients.find((client) => client.id === match.passengerId);

    if (driver && passenger) {
        const estimate_min = 3;

        const data = {
            type: 'driverStarted',
            content: `Driver started: ${estimate_min} minutes left.`,
        }
        sendMessage(JSON.stringify(data), passenger.id);
        res.end();
    } else {
        console.log('error: driver, passenger');
        console.log(driver);
        console.log(passenger);
    }
});

app.get('/api/driver_finished/:id', (req, res) => {
    // Pick the first driver from the clients. 
    const driver = clients.find((client) => client.id === parseInt(req.params.id));
    const match = matches.find((match) => match.driverId === driver.id);
    const passenger = clients.find((client) => client.id === match.passengerId);

    if (driver && passenger) {

        // Send gift to driver.
        const driverData = {
            type: 'gift',
            content: 'A gift from Annie.',
        }
        sendMessage(JSON.stringify(driverData), driver.id);

        // Send rating to passenger.
        const passengerData = {
            type: 'driverFinished',
            content: 'driver finished',
        }
        sendMessage(JSON.stringify(passengerData), passenger.id);

        res.end();
    } else {
        console.log('error: driver, passenger');
        console.log(driver);
        console.log(passenger);
    }
});

app.post('/api/rating_score/driver/:id', (req, res) => {
    // Register rating score in the match.
    const driver = clients.find((client) => client.id === parseInt(req.params.id));
    let match = matches.find((match) => match.driverId === driver.id);
    match.driverRating = parseInt(req.body.rating);
    console.log(match);//debug

    if (match.passengerRating !== -1) {
        const rating_sum = match.passengerRating + match.driverRating;
        if (rating_sum >= 8) {
            // If we got both the rating score and it is above 8 points,
            // broadcast the friend notification to driver and passenger.
            console.log('Friend match success.');
            const data = {
                type: 'newFriend',
                content: 'You got a new friend.'
            }
            sendMessage(JSON.stringify(data), match.passengerId);
            sendMessage(JSON.stringify(data), match.driverId);
        } else {
            console.log(`Friend match failed: driver(${match.driverRating}), passenger(${match.passengerRating})`);
        }
        // Remove the match.
        matches = matches.filter((match, index, matches) => match.driverId !== driver.id);
    }
    console.log(matches); //debug
    res.end();
});

app.post('/api/rating_score/passenger/:id', (req, res) => {
    // Register rating score in the match.
    const passenger = clients.find((client) => client.id === parseInt(req.params.id));
    let match = matches.find((match) => match.passengerId === passenger.id);
    match.passengerRating = parseInt(req.body.rating);
    console.log(match);//debug

    if (match.driverRating !== -1) {
        const rating_sum = match.passengerRating + match.driverRating;
        console.log(`rating sum: ${rating_sum}`);
        if (rating_sum >= 8) {
            // If we got both the rating score and it is above 8 points,
            // broadcast the friend notification to driver and passenger.
            console.log('Friend match success.');
            const data = {
                type: 'newFriend',
                content: 'You got a new friend.'
            }
            sendMessage(JSON.stringify(data), match.passengerId);
            sendMessage(JSON.stringify(data), match.driverId);
        } else {
            console.log(`Friend match failed: driver(${match.driverRating}), passenger(${match.passengerRating})`);
        }
        // Remove the match.
        matches = matches.filter((match, index, matches) => match.passengerId !== passenger.id);
    }
    console.log(matches); //debug
    res.end();
});

const PORT = 3000;

let clients = [];
let matches = [];

app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}...`);
});
