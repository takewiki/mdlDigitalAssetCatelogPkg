#' LinkProd的src表查询
#'
#' @param FDataTableName
#' @param erp_token
#'
#' @return 两个数的和
#' @export
#'
#' @examples
#' LPsrcView_view
LPsrcView_view <- function(erp_token,FDataTableName) {

  sql =  paste0("CALL rds_oms_lpro_src_proc_cnDatableView('", FDataTableName, "');")



  res = tsda::mysql_select2(token =erp_token ,sql = sql)
  return(res)

}
