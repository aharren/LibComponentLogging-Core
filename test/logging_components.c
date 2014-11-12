#include "helper/test_helper.h"

describe("components", {

  lcl_configure_by_component(lcl_cMain, lcl_vInfo);

  it("should log critical", {
    reset_step();
    lcl_log(lcl_cMain, lcl_vCritical, "critical");
    assert_str_equal("C main: critical", buf);
  });

  it("should log error", {
    reset_step();
    lcl_log(lcl_cMain, lcl_vError, "error");
    assert_str_equal("E main: error", buf);
  });

  it("should log info", {
    reset_step();
    lcl_log(lcl_cMain, lcl_vInfo, "info");
    assert_str_equal("I main: info", buf);
  });

});
