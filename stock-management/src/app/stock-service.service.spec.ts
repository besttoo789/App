// import { Component, OnInit } from '@angular/core';
// import { Chart } from 'chart.js';
// import { StockService } from './stock.service';

// @Component({
//   selector: 'app-stock-chart',
//   templateUrl: './stock-chart.component.html',
// })
// export class StockChartComponent implements OnInit {
//   constructor(private stockService: StockService) {}

//   ngOnInit() {
//     const stocks = this.stockService.getStocks();
//     const labels = stocks.map(stock => stock.name);
//     const data = stocks.map(stock => stock.quantity);

//     const ctx = document.getElementById('myChart') as HTMLCanvasElement;
//     new Chart(ctx, {
//       type: 'bar',
//       data: {
//         labels,
//         datasets: [{
//           label: 'จำนวนสินค้า',
//           data,
//           backgroundColor: 'rgba(54, 162, 235, 0.2)',
//           borderColor: 'rgba(54, 162, 235, 1)',
//           borderWidth: 1
//         }]
//       },
//       options: {
//         scales: {
//           y: { beginAtZero: true }
//         }
//       }
//     });
//   }
// }
