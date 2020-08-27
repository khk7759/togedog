<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Togedog</title>
  <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
  <style>
    .zc-body {
      background: #fff;
    }

    .chart--container {
      height: 100%;
      width: 100%;
      min-height: 530px;
    }

    .zc-ref {
      display: none;
    }
  </style>
</head>

<body class="zc-body">

  <div id="weightChart">
    <a href="https://www.zingchart.com/" rel="noopener" class="zc-ref"></a>
  </div>

  <script>
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    // DEFINE CHART LOCATIONS (IDS)
    // -----------------------------
    // Main chart render location
    var chartId = 'weightChart';


    // CHART CONFIG
    // -----------------------------
    var myConfig = {
      type: 'mixed',
      title: {
        text: '',
        align: 'left',
        marginLeft: '23%'
      },
      legend: {
        verticalAlign: 'middle',
        adjustLayout: true
      },
      plot: {
        animation: {
          effect: 'ANIMATION_SLIDE_TOP',
          method: 'ANIMATION_BOUNCE_EASE_OUT',
          sequence: 'ANIMATION_NO_SEQUENCE',
          speed: 975,
          delay: 500,
        },
      },
      scaleX: {
    	/* 최근 레코드 5개 */
        labels: ['2020.05', '2020.06', '2020.07', '2020.08', '2020.09'], //one label for every datapoint
      },
      scaleY: {
    	minValue: 0,
        maxValue: 300000,
        /* step: 1, */
        label: {
          text: 'won',
          fontSize: 14
        },
        guide: { // dashed lines
          visible: false
        }
      },
      scaleY2: {
        minValue: 0,
        maxValue: 1000000,
       /*  step: 1, // can define scale step values or default */
        label: {
          text: 'won',
          fontSize: 14
        }
      } ,
      crosshairX: {
        lineColor: '#424242',
        lineStyle: 'dotted',
        lineGapSize: '4px',
        plotLabel: {
          backgroundColor: "white",
          borderColor: "#e3e3e3",
          borderRadius: "5px",
          bold: true,
          fontSize: "12px",
          fontFamily: "Lato",
          fontColor: "#2f2f2f",
          textAlign: 'right',
          padding: '15px',
          shadow: true,
          shadowAlpha: 0.2,
          shadowBlur: 5,
          shadowDistance: 4,
          shadowColor: "#a1a1a1",
          textAlign: 'left'
        },
        scaleLabel: {
          backgroundColor: '#424242'
        }
      },
      series: [{
        type: 'line',
        values: [160000, 80000, 45000, 30000, 26000].sort().reverse(),
        text: '정산 금액',
        lineColor: '#42a5f5',
        marker: {
          visible: 'false'
        },
        scales: 'scale-x, scale-y'
      }]/* end series  */
    };


    // RENDER CHART
    // -----------------------------
    zingchart.render({
      id: chartId,
      data: myConfig,
      height: 500,
      width: '80%'
    });
  </script>
</body>
</html>
