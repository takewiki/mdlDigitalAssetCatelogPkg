#' 数据资产目录查询
#'
#' @param erp_token
#' @param where_clause
#'
#' @return 两个数的和
#' @export
#'
#' @examples
#' DigitalAssetCatelog_view
DigitalAssetCatelog_view <- function(erp_token,where_clause) {
  sql1 = paste0("

select FID	AS	内码	,
FDataAssetNumber	AS	代码	,
FDataAssetName	AS	名称	,
FDataFieldDesc	AS	字段描述	,
FParentNumber	AS	上级代码	,
FAssetType	AS	类型	,
FIsDetail	AS	是否明细	,
Flevel	AS	级次	,
FIndex	AS	序号	,
FExampleValue	AS	示例值	,
FFieldType	AS	字段类型	,
FFieldNote	AS	字段备注	,
FDeputyDeptName	AS	负责部门	,
FPersonInCharge	AS	负责人
 from rds_erp_byd_src_t_DigitalAssetCatelog

               ")

  if(where_clause==""){
    sql=sql1
  }else{
    sql <- paste0(sql1, "WHERE ", where_clause)

  }


  res = tsda::mysql_select2(token =erp_token ,sql = sql)
  return(res)

}
