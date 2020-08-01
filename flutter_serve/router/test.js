const express = require('express');
const config = require('./config');
const router = express();

const base_url = 'http://' + config.IP + ':' + config.PORT + '/iamges/banner/'

router.use('/', (req, res) => {
  const data = {
    code: '10000',
    message: 'success',
    data: [
      {
        iamge: base_url + '1.jpeg'
      },
      {
        iamge: base_url + '1.jpeg'
      },
      {
        iamge: base_url + '1.jpeg'
      },
    ]
  }
  res.send(data)
})

module.exports = router;