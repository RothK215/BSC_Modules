var myMap = L.map("map", {
    center: [37.7749, -122.4194],
    zoom: 5
})

// Tile Layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(myMap);

// Weekly Earthquakes
let url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson";

// Style
function chooseColor(mag) {
    if (mag >= 1) return "green";
    else if (mag >= 2) return "yellow";
    else if (mag >= 3) return "orange";
    else if (mag >= 4) return "red";
    else return "purple"; 
}

// Log data into console
d3.json(url).then(function (response) {
    console.log(response);
    L.geoJson(response, {
        // Styling each feature
        onEachFeature: function(feature, layer) {
            layer.bindPopup("<h1>" + feature.properties.place + "</h1> <hr> <h2>" + feature.geometry.coordinates + "</h2>");
        }
    }).addTo(myMap);
});

// Create Layer for earthquakes


