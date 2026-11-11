import SwiftUI

struct Stock: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let currentPrice: Double
    let changePercent: Double
}

struct WatchlistView: View {
    let stocks: [Stock] = [
        Stock(symbol: "AAPL", name: "苹果公司", currentPrice: 180.50, changePercent: 1.25),
        Stock(symbol: "TSLA", name: "特斯拉", currentPrice: 220.10, changePercent: -0.85),
        Stock(symbol: "NVDA", name: "英伟达", currentPrice: 880.00, changePercent: 3.40)
    ]
    
    var body: some View {
        NavigationStack {
            List(stocks) { stock in
                NavigationLink(destination: StockChartView(stock: stock)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(stock.name).font(.headline)
                            Text(stock.symbol).font(.subheadline).foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("$\(String(format: "%.2f", stock.currentPrice))")
                                .font(.headline)
                            Text(String(format: "%+.2f%%", stock.changePercent))
                                .font(.subheadline)
                                .foregroundColor(stock.changePercent >= 0 ? .red : .green)
                        }
                    }
                }
            }
            .navigationTitle("我的收仓")
        }
    }
}