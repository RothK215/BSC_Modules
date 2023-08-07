// Weekly Earthquakes
let url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson";

// Style
function chooseColor(mag) {
    if (mag <= 1.0) return "green";
    else if (mag <= 2.0) return "yellow";
    else if (mag <= 3.0) return "orange";
    else if (mag <= 4.0) return "red";
    else if (mag > 4.0)return "purple"; 
    else return "black";
}

// Log data into console
d3.json(url).then(function (response) {
    createFeatures(response.features);
});

// Create Features from the url
function createFeatures(earthquakeData) {
    function onEachFeature(feature, layer) {
        layer.bindPopup(`<h3>${feature.properties.place}</h3><hr><p>${new Date(feature.properties.time)}</p>`);
    }

    var earthquakes = L.geoJSON(earthquakeData, {
        onEachFeature: onEachFeature,

        pointToLayer: function(feature, layer) {
            return L.circle(layer, {
                radius: feature.properties.mag * 40000,
                fillColor: chooseColor(feature.properties.mag),
                color: "#000",
                weight: .75,
                opacity: 1,
                fillOpacity: 0.5
            });
        }
    });
    createMap(earthquakes);
}

// Create Legend for earthquakes



legend.addTo(myMap);

function createMap(earthquakes) {
    // Create the base layers.
    var street = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    })
  
    // Create a baseMaps object.
    var baseMaps = {
      "Street Map": street,
    };
  
    // Create an overlay object to hold our overlay.
    var overlayMaps = {
      Earthquakes: earthquakes
    };
  
    // Create our map, giving it the streetmap and earthquakes layers to display on load.
    var myMap = L.map("map", {
      center: [
        37.09, -95.71
      ],
      zoom: 5,
      layers: [street, earthquakes]
    });
    var legend = L.control({position: "bottomright"});
    legend.onAdd = function() {
        
    }
    // Create a layer control.
    // Pass it our baseMaps and overlayMaps.
    // Add the layer control to the map.
    L.control.layers(baseMaps, overlayMaps, {
      collapsed: false
    }).addTo(myMap);
  
}