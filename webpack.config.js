const path = require("path");
const webpack = require("webpack");
const merge = require("webpack-merge");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const autoprefixer = require("autoprefixer");
const ExtractTextPlugin = require("extract-text-webpack-plugin");

const TARGET_ENV = process.env.npm_lifecycle_event === "build" ? "production" : "development";

const commonConfig = {
  output: {
    path:       path.resolve(__dirname, "dist/"),
    filename: "[hash].js",
  },

  resolve: {
    modulesDirectories: ["node_modules"],
    extensions:         ["", ".js", ".elm"],
  },

  module: {
    noParse: /\.elm$/,
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: "src/index.html",
      inject:   "body",
      filename: "index.html",
    })
  ],

  postcss: [ autoprefixer({ browsers: ["last 2 versions"] }) ],

}

if (TARGET_ENV === "development") {
  module.exports = merge(commonConfig, {
    entry: [
      "webpack-dev-server/client?http://localhost:8080",
      path.join(__dirname, "src/index.js"),
    ],

    devServer: {
      inline:   true,
      progress: true,
      historyApiFallback: {
        verbose: true,
        rewrites: [
          {
            from: /.*\.js/,
            to: function(content) {
              return '/' + content.parsedUrl.pathname.replace(/^(\/.+\/)/, "");
            }
          }
        ]
      }
    },

    module: {
      loaders: [
        {
          test:    /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          loader:  "elm-hot!elm-webpack",
        },
        {
          test: /\.js$/,
          exclude: /(node_modules|bower_components)/,
          loader: "babel",
          query: {
            presets: ["es2015"]
          },
        },
        {
          test: /\.(css|scss)$/,
          loaders: [
            "style-loader",
            "css-loader",
            "postcss-loader",
            "sass-loader",
          ]
        }
      ]
    }

  });
}

if (TARGET_ENV === 'production') {
  module.exports = merge(commonConfig, {
    entry: path.join(__dirname, "src/index.js"),

    module: {
      loaders: [
        {
          test:    /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          loader:  "elm-webpack"
        },
        {
          test: /\.js$/,
          exclude: /(node_modules|bower_components)/,
          loader: "babel",
          query: {
            presets: ["es2015"]
          }
        },
        {
          test: /\.(css|scss)$/,
          loader: ExtractTextPlugin.extract("style-loader", [
            "css-loader",
            "postcss-loader",
            "sass-loader"
          ])
        }
      ]
    },

    plugins: [
      new webpack.optimize.OccurenceOrderPlugin(),
      new ExtractTextPlugin("./[hash].css", { allChunks: true }),

      new webpack.optimize.UglifyJsPlugin({
        minimize: true,
        compressor: { warnings: false }
      })
    ],
  });
}
