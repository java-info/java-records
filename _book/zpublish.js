#!/usr/bin/env node

const path = require('path')
const fs   = require('fs')
var stat   = fs.stat

function copy(src, dst) {
  //读取目录
  fs.readdir(src, function (err, paths) {
    console.log(paths)
    if (err) {
      throw err
    }
    paths.forEach(function (path) {
      var _src = src + '/' + path
      var _dst = dst + '/' + path
      var readable
      var writable
      stat(_src, function (err, st) {
        if (err) {
          throw err
        }

        if (st.isFile()) {
          readable = fs.createReadStream(_src)//创建读取流
          writable = fs.createWriteStream(_dst)//创建写入流
          readable.pipe(writable)
        } else if (st.isDirectory()) {
          exists(_src, _dst, copy)
        }
      })
    })
  })
}

function exists(src, dst, callback) {
  //测试某个路径下文件是否存在
  fs.exists(dst, function (exists) {
    if (exists) {//不存在
      callback(src, dst)
    } else {//存在
      fs.mkdir(dst, function () {//创建目录
        callback(src, dst)
      })
    }
  })
}

exists(path.resolve(__dirname, './_book'), path.resolve(__dirname, '../records'), copy)