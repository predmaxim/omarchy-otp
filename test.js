// node test.js
const fs = require("fs")
const assert = require("assert")
// Every tr("…") in the QML has a Russian line, and no Cyrillic is left outside tr().
const I = new Function(fs.readFileSync(__dirname + "/I18n.js", "utf8").replace(".pragma library", "") + "; return { TABLES, translator }")()
const qml = fs.readFileSync(__dirname + "/Otp.qml", "utf8")
const keys = [...qml.matchAll(/\btr\("((?:[^"\\]|\\.)*)"/g)].map(m => m[1])
assert.ok(keys.length >= 1, "found " + keys.length + " tr() calls")
assert.deepStrictEqual(keys.filter(k => !(k in I.TABLES.ru)), [])
assert.deepStrictEqual(qml.split("\n").filter(l => /[А-Яа-яЁё]/.test(l)), [])
assert.strictEqual(I.translator("ru")("Copy UTM OTP code"), "Скопировать код UTM OTP")
console.log("ok i18n")
