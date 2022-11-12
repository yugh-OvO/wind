package wind.common.core.service;

import wind.common.core.domain.dto.OperationLogDTO;
import org.springframework.scheduling.annotation.Async;

/**
 * 通用 操作日志
 *
 * @author Yu Gaoheng
 */
public interface OperationLogService {

    @Async
    void recordOperation(OperationLogDTO operationLogDTO);
}
