$(function() {
  return $('#circle_postcode').jpostal({
    postcode: ['#circle_postcode'],
    address: {
      '#circle_prefecture_code': '%3',
      '#circle_address_city': '%4',
      '#circle_address_street': '%5%6%7',
    },
  });
});