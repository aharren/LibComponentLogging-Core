#include "helper/test_helper.h"

describe("default not DEBUG configuration", {


  it("should log Critical", {
    reset_step();
    lcl_log(lcl_cMain, lcl_vCritical, "critical");
    assert_str_equal("C main: critical", buf);
  });

  it("should log Error", {
    reset_step();
    lcl_log(lcl_cMain, lcl_vError, "error");
    assert_str_equal("E main: error", buf);
  });

  it("should not log Info", {
    reset_step();
    lcl_log(lcl_cMain, lcl_vInfo, "info");
    assert_str_equal("", buf);
  });

  it("should log Info on component configuration for Trace", {
    reset_step();
    lcl_configure_by_name("*", lcl_vTrace);
    lcl_log(lcl_cMain, lcl_vInfo, "info");
    assert_str_equal("I main: info", buf);
  });

  it("should not log Warning on component configuration for Error", {
    reset_step();
    lcl_configure_by_name("*", lcl_vError);
    lcl_log(lcl_cMain, lcl_vWarning, "warning");
    assert_str_not_equal("W main: warning", buf);
  });

});
