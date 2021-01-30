$(document).on('turbolinks:load', function() {
  const ctx = document.getElementById('chartDonate');
  const donutChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: JSON.parse(ctx.dataset.labels),
      datasets: [{
        data: JSON.parse(ctx.dataset.data),
        backgroundColor: ['#f56954', '#00a65a', '#f39c12']
      }]
    },
    options: {
      maintainAspectRatio : false,
      responsive: true,
      pieceLabel: {
        render: JSON.parse(ctx.dataset.data)
      }
    }
  })
});

$(document).on('turbolinks:load', function() {
  const ctx = document.getElementById('chartThings');
  const donutChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: JSON.parse(ctx.dataset.labels),
      datasets: [{
        data: JSON.parse(ctx.dataset.data),
        backgroundColor: ['#f56954', '#00a65a', '#f39c12', 'yellow', 'blue']
      }]
    },
    options: {
      maintainAspectRatio : false,
      responsive: true,
      pieceLabel: {
        render: JSON.parse(ctx.dataset.data)
      }
    }
  })
});