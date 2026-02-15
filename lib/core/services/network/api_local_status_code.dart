enum ApiLocalStatusCode {
  // =========================
  // 🌐 Network Errors (1000+)
  // =========================
  connectionError(1000),
  connectionTimeout(1001),
  sendTimeout(1002),
  receiveTimeout(1003),
  badCertificate(1004),
  badResponse(1005),
  cancel(1006),
  unknown(1007),
  defaultError(1008),

  // =========================
  // 📡 HTTP Status Codes
  // =========================
  ok(200),
  created(201),
  noContent(204),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  conflict(409),
  unprocessableEntity(422),

  internalServerError(500),
  badGateway(502),
  serviceUnavailable(503),
  gatewayTimeout(504);

  final int code;
  const ApiLocalStatusCode(this.code);
}
