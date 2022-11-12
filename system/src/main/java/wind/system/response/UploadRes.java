package wind.system.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UploadRes {

    /**
     * 文件路径
     */
    private String url;

    /**
     * 文件名
     */
    private String name;

}
