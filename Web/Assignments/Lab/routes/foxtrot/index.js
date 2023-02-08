const express = require('express');

const router = express.Router()

router.get("/:value", (req, res) => {
    const value = req.params.value
    if (value === "kilo")
        res.send("<h1>SUCCESS! Received kilo via foxtrot</h1>")
})

module.exports = router