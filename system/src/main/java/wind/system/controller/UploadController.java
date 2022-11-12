package wind.system.controller;

import cn.hutool.core.map.MapUtil;
import wind.common.core.controller.BaseController;
import wind.common.core.domain.R;
import wind.system.service.UploadService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * 参数配置 信息操作处理
 *
 * @author Yu Gaoheng
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system")
public class UploadController extends BaseController {

    private final UploadService service;

    /**
     * 上传
     *
     * @param file 文件
     */
    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Map<String, Object>> avatar(@RequestPart("file") MultipartFile file) {
        if (!file.isEmpty()) {
            String url = service.upload(file);
            Map<String, Object> result = MapUtil.newHashMap();
            result.put("url", url);
            return R.ok(result);
        }
        return R.fail("上传功能异常，请联系管理员");
    }

}
