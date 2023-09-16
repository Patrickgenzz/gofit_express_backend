const logRequest = (req, res, next) => {
  console.log("Log Request: ", {
    method: req.method,
    path: req.path,
  });
  next();
};

module.exports = logRequest;
