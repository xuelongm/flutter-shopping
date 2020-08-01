const express = require('express');
const path = require('path');


const app = express();

app.use(express.static(path.resolve(__dirname, 'public')));

//拦截器
app.use(function(req, res, next) {
  const proxy = req.query.proxy;
  if(proxy) {
    req.header.cookie = req.query.cookie + `__proxy__${proxy}`;
  }

  console.log(req.url);
  next();
})

const port = process.env.port || 3000;

app.listen(port, () => {
  console.log(`serve start runing port ${port}`);
})

app.use('/homePageContent', require('./router/home_page_content'));
app.use('/hotgoods', require('./router/hotgoods'));