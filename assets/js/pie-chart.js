import Chart from 'chart.js'

class PieChart {
  constructor (ctx, labels, values, background_colors) {
    this.chart = new Chart(ctx, {
      type: 'pie',
      data: {
        labels: labels,
        datasets: [
          {
            data: values,
            backgroundColor: background_colors
          }
        ]
      },
      options: {
        legend: {
          display: false
        }
      }
    })
  }

  addPoint (label, value, background) {
    const labels = this.chart.data.labels
    const data = this.chart.data.datasets[0].data
    const backgrounds = this.chart.data.datasets[0].backgroundColor

    labels.push(label)
    data.push(value)
    backgrounds.push(background)

    this.chart.update()
  }
}

export default PieChart
