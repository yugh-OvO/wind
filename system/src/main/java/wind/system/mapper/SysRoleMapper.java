package wind.system.mapper;

import wind.common.core.mapper.BaseMapperPlus;
import wind.system.domain.SysRole;

import java.util.List;

/**
 * 角色表 数据层
 *
 * @author Yu Gaoheng
 */
public interface SysRoleMapper extends BaseMapperPlus<SysRoleMapper, SysRole, SysRole> {

    List<SysRole> selectRolePermissionByUserId(Integer userId);

}
