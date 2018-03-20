const path = require('path');

// Constant with our paths
const paths = {
  DIST: path.resolve(__dirname, 'dist'),
  SRC:  path.resolve(__dirname, 'app'),
  JS:   path.resolve(__dirname, 'app/javascripts'),
};

const HtmlWebpackPlugin = require('html-webpack-plugin'); // Import our plugin -> ADDED IN THIS STEP
const ExtractTextPlugin = require('extract-text-webpack-plugin'); //  -> ADDED IN THIS STEP

// Webpack configuration
module.exports = {
  entry: path.join(paths.JS, 'index.js'),
  output: {
    path: paths.DIST,
    filename: 'bundle.js'
  },
  devServer: {
    contentBase: paths.SRC,
    port: 5000,
    historyApiFallback: true,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
      "Access-Control-Request-Method": '*',
      "Access-Control-Allow-Headers": "'Origin, X-Requested-With, Content-Type, Accept, Authorization"
    },
    proxy: {
      "/api": {
        target: "http://localhost:4100",
        pathRewrite: {"^/api" : ""}
      }
    }
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.join(paths.SRC, 'index.html'),
      filename: 'index.html'
    }),
    new ExtractTextPlugin('style.bundle.css')
  ],
  // Loaders configuration -> ADDED IN THIS STEP
  // We are telling webpack to use "babel-loader" for .js and .jsx files
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: [
          'babel-loader',
        ],
      },
      {
        test: /\.(s*)css$/,
        loader: ExtractTextPlugin.extract({
          use: ['css-loader','sass-loader']
        }),
      },
      {
        test: /\.(png|jpg|gif|svg)$/,
        use: [
          'file-loader'
        ],
      }
    ]
  },
  // Enable importing JS files without specifying their's extenstion -> ADDED IN THIS STEP
  //
  // So we can write:
  // import MyComponent from './my-component';
  //
  // Instead of:
  // import MyComponent from './my-component.jsx';
  resolve: {
    extensions: ['.js', '.jsx'],
  }
};