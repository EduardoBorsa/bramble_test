import PieChart from './pie-chart'

const Hooks = {}

Hooks.PieChart = {
  mounted () {
    console.log(JSON.parse(this.el.dataset.chartData))
    const { labels, values, background_colors } = JSON.parse(this.el.dataset.chartData)
    this.chart = new PieChart(this.el, labels, values, background_colors)

    this.handleEvent('new-point', ({ label, value, background_color }) => {
      console.log('label: ', label)
      console.log('value: ', value)
      console.log('background_color: ', background_color)
      this.chart.addPoint(label, value, background_color)
    })
  }
}

export default Hooks
