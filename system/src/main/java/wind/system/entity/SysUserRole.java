package wind.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 用户和角色关联 sys_user_role
 *
 * @author Yu Gaoheng
 */

@Data
@TableName("sys_user_role")
public class SysUserRole {

    /**
     * 用户ID
     */
    @TableId(type = IdType.INPUT)
    private Integer userId;

    /**
     * 角色ID
     */
    private Integer roleId;

}
