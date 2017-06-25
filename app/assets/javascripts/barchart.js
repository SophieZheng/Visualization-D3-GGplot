
var svg = d3.select("svg"),
    margin = {top: 20, right: 20, bottom: 30, left: 40},
    width = +svg.attr("width") - margin.left - margin.right,
    height = +svg.attr("height") - margin.top - margin.bottom;

var x = d3.scaleBand().rangeRound([0, width]).padding(0.1),
    y = d3.scaleLinear().rangeRound([height, 0]);

var xAxis = d3.axisBottom(x);

var g = svg.append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var url = '/graph/data';

d3.json(url, function(error, data) {
  // alert( data[0].device);
  if (error) throw error;

  data.forEach(function(d) {
    d.count = +d.count;
  });

  x.domain(data.map(function(d) { return d.device; }));
  y.domain([0, d3.max(data, function(d) { return d.count; })]);

  g.append("g")
      .attr("class", "axis x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  g.append("g")
      .attr("class", "axis y axis")
      .call(d3.axisLeft(y))
    .append("text")
      .attr("transform", "rotate(90)")
      .attr("y", 6)
      .attr("dy", "0.71em")
      .attr("text-anchor", "end")
      .text("Count");

  var bar = g.selectAll(".bar")
	    .data(data)
	    .enter().append("rect")
	      .attr("class", "bar")
	      .attr("x", function(d) { return x(d.device); })
	      .attr("y", function(d) { return y(d.count); })
	      .attr("width", x.bandwidth())
	      .attr("height", function(d) { return height - y(d.count); })

  d3.select("input").on("change", change);

  var sortTimeout = setTimeout(function() {
    d3.select("input").property("checked", true).each(change);
  }, 2000);

  function change() {
    clearTimeout(sortTimeout);

    // Copy-on-write since tweens are evaluated after a delay.
    var x0 = x.domain(data.sort(this.checked
        ? function(a, b) { return b.count - a.count; }
        : function(a, b) { return d3.ascending(a.device, b.device); })
        .map(function(d) { return d.device; }))
        .copy();

    svg.selectAll(".bar")
        .sort(function(a, b) { return x0(a.device) - x0(b.device); });

    var transition = svg.transition().duration(750),
        delay = function(d, i) { return i * 50; }

    transition.selectAll(".bar")
        .delay(delay)
        .attr("x", function(d) { return x0(d.device); });

    transition.select(".x.axis")
        .call(xAxis)
      .selectAll("g")
        .delay(delay);
  }
});



