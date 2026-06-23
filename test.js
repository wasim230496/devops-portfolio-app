const request = require("supertest");
const assert = require("assert");
const server = require("./server");

describe("GET /", () => {
  it("should return 200 OK and healthy status", (done) => {
    request(server)
      .get("/")
      .expect(200)
      .end((err, res) => {
        if (err) return done(err);
        assert.strictEqual(res.body.status, "healthy");
        server.close();
        done();
      });
  });
});
