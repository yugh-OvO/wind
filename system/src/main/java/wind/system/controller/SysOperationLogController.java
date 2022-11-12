package wind.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import wind.common.core.controller.BaseController;
import wind.common.core.domain.PageQuery;
import wind.common.core.domain.R;
import wind.common.core.page.TableDataInfo;
import wind.system.domain.SysOperationLog;
import wind.system.service.OperationLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 操作日志记录
 *
 * @author Yu Gaoheng
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/operationLog")
public class SysOperationLogController extends BaseController {

    private final OperationLogService service;

    /**
     * 获取操作日志记录列表
     */
    @SaCheckPermission("operationLogList")
    @GetMapping("/list")
    public R<TableDataInfo<SysOperationLog>> list(SysOperationLog operationLog, PageQuery pageQuery) {
        return R.ok(service.list(operationLog, pageQuery));
    }

}