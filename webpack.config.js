// http://matthewlehner.net/using-webpack-with-phoenix-and-elixir/

var CopyWebpackPlugin = require('copy-webpack-plugin')
var ExtractTextPlugin = require("extract-text-webpack-plugin");
var CompressionPlugin = require("compression-webpack-plugin")
var webpack = require('webpack')

module.exports = {
  entry: {
    app: [
      "./web/static/scss/main.scss",
      "./web/static/js/app.js"
    ],
    vendor: [
      "./web/static/scss/bootstrap.scss",
      "./web/static/js/vendor.js"
    ]
  },
  output: {
    path: "./priv/static/js",
    filename: "[name].js"
  },

  module: {
    loaders: [
    // {
    //   test: /\.js$/,
    //   exclude: /node_modules/,
    //   loader: "babel",
    //   query: {
    //     presets: ["es2015", "stage-2", "stage-3", "react"]
    //   }
    // },
    {
      test: /\.scss$/,
      loader: ExtractTextPlugin.extract('style-loader', 'css?sourceMap!sass?sourceMap')
    },{
      test: /\.(otf|eot|svg|ttf|woff)/,  // fonty powinny wychodzić jeszcze z folderu css
      loader: 'url-loader?limit=8192'
    },{
      test: /\.(jpg|gif|png)/
    }]
  },

  resolve: {
    modulesDirectories: [ "node_modules", __dirname + "/web/static/js" ] // eslint-disable-line no-undef
  },

  plugins: [
    new CopyWebpackPlugin([{ from: "./web/static/assets" }]),
    new ExtractTextPlugin("[name].css"),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "window.jQuery": "jquery"
    }),
    new CompressionPlugin({
      asset: "[path].gz[query]",
      algorithm: "gzip",
      test: /\.js$|\.css$/,
      threshold: 10240,
      minRatio: 0.8
    })
  ]
}
