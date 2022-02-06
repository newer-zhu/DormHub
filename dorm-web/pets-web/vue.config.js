let proxyObj = {}
proxyObj['/ws'] = {
  ws: true,
  target: 'ws://localhost:8888'
};
proxyObj['/api'] = {
//websocket
  ws: false,
//目标地址
  target: 'http://localhost:8888',
//发送请求头中host会设置成target
  changeOrigin: true,
//重写api开头请求地址
  pathRewrite: {
    '^/api': ''
  }
};

module.exports = {
  devServer: {
    host: 'localhost',
    port: 8080,
    proxy: proxyObj,
  },
  outputDir: 'dist',  //build输出目录
  assetsDir: 'assets', //静态资源目录（js, css, img）
  lintOnSave: false, //是否开启eslint
};
