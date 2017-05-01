$(document).ready(function() {
    
$.getJSON('http://temperatura-wykres.cba.pl/temp.php?callback=?', function (data) {
    
    
function requestData() {
    $.ajax({
        url: 'http://temperatura-wykres.cba.pl/live.php',
        success: function(point) {
            var series = chart.series[0],
                shift = series.data.length > 20; // shift if the series is 
                                                 // longer than 20

            // add the point
            chart.series[0].addPoint(point, true, shift);
            
            // call it again after one second
            setTimeout(requestData, 1000);    
        },
        cache: false
    });
}

    // Create the chart
    chart = new Highcharts.stockChart({
        
        chart: {
            renderTo: 'chart',
            events: {
                load: requestData
            }
        },

        rangeSelector: {
            enabled: true,
        },
        
        xAxis: {
            range: 86400000
        },
        
        series: [{
            name: 'Brightness',
            data: data,
            tooltip: {
                valueDecimals: 2
            }
        }]
    });
});

    
});