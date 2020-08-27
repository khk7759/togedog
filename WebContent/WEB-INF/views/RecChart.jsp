<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
 
<head>
  <meta charset="utf-8">
  <title>Togedog</title>
 
  <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
  <style>
    @import 'https://fonts.googleapis.com/css?family=Open+Sans';
    html,
    body {
      width: 100%;
      height: 100%;
    }
 
    #myChart {
      width: 100%;
      height: 100%;
      min-height: 250px;
    }
 
    .zc-ref {
      display: none;
    }
  </style>
</head>
 
<body>
  <div id='myChart' align="center"></div>
  <script>
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    var myConfig = {
      type: "pie",
      plot: {
        borderColor: "#2B313B",
        borderWidth: 2,
        // slice: 90,
        valueBox: {
          placement: 'out',
          text: '%t\n%npv%',
          fontFamily: "Open Sans"
        },
        tooltip: {
          fontSize: '18',
          fontFamily: "Open Sans",
          padding: "5 10",
          text: "%npv%"
        },
        animation: {
          effect: 2,
          method: 5,
          speed: 800,
          sequence: 1,
          delay: 1000
        }
      },
      source: {
        text: 'ⓒTOGEDOG',
        fontColor: "#8e99a9",
        fontFamily: "Open Sans"
      },
      title: {
        fontColor: "#8e99a9",
        text: '',
        align: "left",
        offsetX: 10,
        fontFamily: "Open Sans",
        fontSize: 25
      },
      subtitle: {
        offsetX: 10,
        offsetY: 10,
        fontColor: "#8e99a9",
        fontFamily: "Open Sans",
        fontSize: "16",
        text: '',
        align: "left"
      },
      plotarea: {
        margin: "20 0 0 0"
      },
      series: [{
          values: [11.38],
          text: "산책기록",
          backgroundColor: '#50ADF5',
        },
        {
          values: [56.94],
          text: "교육기록",
          backgroundColor: '#FF7965',
          detached: true
        },
        {
          values: [14.52],
          text: '미용기록',
          backgroundColor: '#FFCB45',
          detached: true
        },
        {
          text: '건강기록',
          values: [9.69],
          backgroundColor: '#6877e5'
        },
        {
          text: '기타기록',
          values: [7.48],
          backgroundColor: '#6FB07F'
        }
      ]
    };
 
    zingchart.render({
      id: 'myChart',
      data: myConfig,
      height: '110%',
      width: '110%'
    });
  </script>
</body>
 
</html>