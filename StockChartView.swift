import SwiftUI
import Charts

struct PricePoint: Identifiable {
    let id = UUID()
    let date: Date
    let price: Double
}

struct StockChartView: View {
    let stock: Stock
    
    var mockData: [PricePoint] {
        let now = Date()
        var data: [PricePoint] = []
        for i in 0..<30 {
            let date = Calendar.current.date(byAdding: .day, value: -i, to: now)!
            let randomPrice = stock.currentPrice + Double.random(in: -10...10)
            data.append(PricePoint(date: date, price: randomPrice))
        }
        return data.reversed()
    }
    
    var body: some View {
        VStack {
            Text("\(stock.name) 走势图")
                .font(.title2)
                .padding()
            
            Chart(mockData) { point in
                LineMark(
                    x: .value("日期", point.date),
                    y: .value("收盘价", point.price)
                )
                .foregroundStyle(.blue)
                .interpolationMethod(.catmullRom)
            }
            .frame(height: 300)
            .padding()
            
            Spacer()
        }
        .navigationTitle(stock.symbol)
        .navigationBarTitleDisplayMode(.inline)
    }
}