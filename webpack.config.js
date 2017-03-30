var CopyWebpackPlugin = require('copy-webpack-plugin')
var ExtractTextPlugin = require("extract-text-webpack-plugin")
var webpack = require('webpack')

module.exports = {
  entry: {
    app: [
      "./apps/app/web/static/scss/main.scss",
      "./apps/app/web/static/scss/bootstrap.scss",
      "./apps/app/web/static/js/app.js"
    ],
  },
  output: {
    path: "./apps/app/priv/static/js",
    filename: "[name].js"
  },

  module: {
    rules: [{
      test: /\.js$/,
      exclude: /node_modules/,
      loader: "babel-loader",
      query: {
        presets: ["es2015"]
      }
    }, {
      test: /\.scss$/,
      loader: ExtractTextPlugin.extract({
        fallback: 'style-loader',
        use: ['css-loader', 'sass-loader']
      })
    },{
      test: /\.(otf|eot|svg|ttf|woff)/,  // fonty powinny wychodzić jeszcze z folderu css
      loader: 'url-loader'
    },{
      test: /\.(jpg|gif|png)/
    }]
  },

  resolve: {
    modules: [ "node_modules", "apps", __dirname + "/web/static/js" ] // eslint-disable-line no-undef
  },

  plugins: [
    // new CopyWebpackPlugin([{ from: "./web/static/assets" }]),
    new ExtractTextPlugin("[name].css"),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "window.jQuery": "jquery"
    }),
  ]
}
