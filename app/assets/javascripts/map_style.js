MapStyle = {
  displayRules: [new OpenLayers.Rule({
      symbolizer: {"Line" : { strokeWidth: 4,
                              strokeColor: '#000000',
                              strokeOpacity: 0.8 },
                    "Point" : { pointRadius: 8,
                                strokeColor: '#000000',
                                strokeOpacity: 0.9,
                                strokeWidth: 2,
                                fillOpacity: 0.3,
                                fillColor: '#ffffff' },
                    "Polygon" : { strokeWidth: 2.5,
                                  strokeOpacity: 0.8,
                                  strokeColor: '#000000',
                                  fillColor: '#ffffff' }
      },
      elseFilter: true
  })],

  displayStyle: function() {
    var styleMap = new OpenLayers.StyleMap();
    styleMap.styles["default"].addRules(this.displayRules);
    styleMap.styles["select"].addRules(this.displayRules);
    return styleMap;
  }
}
