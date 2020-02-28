let fakestockmarketgenerator = require('fake-stock-market-generator')
let fs = require("fs")

let stocks = [...Array(20).keys()].map(i => {
	return fakestockmarketgenerator.generateStockData(10)
}) 
fs.writeFileSync('stocks.json', JSON.stringify(stocks, null, 4));
