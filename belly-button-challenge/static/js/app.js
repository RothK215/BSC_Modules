
// This was the correct pull for the data //

function buildMetadata(sample) {
  d3.json("https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-classroom/v1.1/14-Interactive-Web-Visualizations/02-Homework/samples.json").then((data) => {
    let metadata = data.metadata;

    // Filter the data for the object with the desired sample number
    let resultArray = metadata.filter(sampleObj => sampleObj.id == sample);
    let result = resultArray[0];

    // Use d3 to select the panel with id of `#sample-metadata`
    let PANEL = d3.select("#sample-metadata");

    // Use `.html("") to clear any existing metadata
    PANEL.html("");

    // Hint: Inside the loop, you will need to use d3 to append new
    // tags for each key-value in the metadata.

    for (key in result){
      PANEL.append("h6").text(`${key.toUpperCase()}: ${result[key]}`);
    };
    // BONUS: Build the Gauge Chart
    // buildGauge(result.wfreq);
  });
}

function buildCharts(sample) {
  d3.json("https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-classroom/v1.1/14-Interactive-Web-Visualizations/02-Homework/samples.json").then((data) => {
    let samples = data.samples;
    let resultsArray = samples.filter(sampleObj => sampleObj.id == sample);
    let result = resultsArray[0];

    let otu_ids = result.otu_ids;
    let otu_labels = result.otu_labels;
    let sample_values = result.sample_values;

    // Horizontal Bar Chart //
    let barData = [{
      y: sample_values,
      axisY: otu_labels,
      type: "bar",
      orientation: 'h'
    }];

    let barLayout = {
      title: "Top 10 Bacteria Cultures Found",
      margin: { t: 50, l: 100 }
    };

    Plotly.newPlot("bar", barData, barLayout);

    // Bubble Chart
    let bubbleData = [{
      x: otu_ids,
      y: sample_values,
      text: otu_labels,
      mode: "markers",
      marker: {
        size: sample_values,
        color: otu_ids
      }
    }];

    let bubbleLayout = {
      title: "Bubble Cultures Per Sample",
      margin: { t: 0 },
      hovermode: "closest",
      xaxis: {title: "OTU ID" },
      margin: { t:30 },
    };

    Plotly.newPlot("bubble", bubbleData, bubbleLayout);
    
  });
}


function init() {
  // Grabs a reference to the dropdown selection element
  let selector = d3.select("#selDataset");

  // Use the list of sample names to populate the select options
  d3.json("https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-classroom/v1.1/14-Interactive-Web-Visualizations/02-Homework/samples.json").then((data) => {
    let sampleNames = data.names;

    for (let i = 0; i < sampleNames.length; i++) {
      selector
        .append("option")
        .text(sampleNames[i])
        .property("value", sampleNames[i]);
    };

    // Use the first sample from the list to build the initial plots
    let newSample = sampleNames[0];
    buildCharts(newSample);
    buildMetadata(newSample);
  });
}

function optionChanged(newSample) {
  // Fetch the new data each time a new sample is slected
  buildCharts(newSample);
  buildMetadata(newSample);
}

// Initialize the dashboard
init();

