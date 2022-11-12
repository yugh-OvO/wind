package wind.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.secure.BCrypt;
import cn.hutool.core.util.ArrayUtil;
import wind.common.annotation.Log;
import wind.common.constant.UserConstants;
import wind.common.core.controller.BaseController;
import wind.common.core.domain.PageQuery;
import wind.common.core.domain.R;
import wind.common.core.page.TableDataInfo;
import wind.common.enums.BusinessType;
import wind.common.helper.LoginHelper;
import wind.common.utils.StreamUtils;
import wind.common.utils.StringUtils;
import wind.system.domain.SysRole;
import wind.system.domain.SysUser;
import wind.system.service.ISysRoleService;
import wind.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户信息
 *
 * @author Yu Gaoheng
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/user")
public class SysUserController extends BaseController {

    private final ISysUserService userService;
    private final ISysRoleService roleService;

    /**
     * 获取用户列表
     */
    @SaCheckPermission("userList")
    @GetMapping("/list")
    public R<TableDataInfo<SysUser>> list(SysUser user, PageQuery pageQuery) {
        return R.ok(userService.selectPageUserList(user, pageQuery));
    }

    /**
     * 根据用户编号获取详细信息
     *
     * @param userId 用户ID
     */
    @SaCheckPermission("userList")
    @GetMapping(value = {"/", "/{userId}"})
    public R<SysUser> getInfo(@PathVariable(value = "userId", required = false) Integer userId) {
        Map<String, Object> ajax = new HashMap<>();
        List<SysRole> roles = roleService.selectRoleAll();
        ajax.put("roles", LoginHelper.isAdmin(userId) ? roles : StreamUtils.filter(roles, r -> !r.isAdmin()));
        SysUser sysUser = userService.selectUserById(userId);
        sysUser.setRoleIds(StreamUtils.toList(roleService.selectRolesByUserId(sysUser.getId()), SysRole::getId).stream().toArray(Integer[]::new));
        return R.ok(sysUser);
    }

    /**
     * 新增用户
     */
    @SaCheckPermission("userList")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Void> add(@Validated @RequestBody SysUser user) {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUsername()))) {
            return R.fail("新增用户'" + user.getUsername() + "'失败，登录账号已存在");
        } else if (StringUtils.isNotEmpty(user.getMobile())
            && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return R.fail("新增用户'" + user.getUsername() + "'失败，手机号码已存在");
        }
        user.setPassword(BCrypt.hashpw(user.getPassword()));
        return toAjax(userService.insertUser(user));
    }

    /**
     * 修改用户
     */
    @SaCheckPermission("userList")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Void> edit(@Validated @RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        if (StringUtils.isNotEmpty(user.getMobile())
            && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return R.fail("修改用户'" + user.getUsername() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(user.getEmail())
            && UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
            return R.fail("修改用户'" + user.getUsername() + "'失败，邮箱账号已存在");
        }
        return toAjax(userService.updateUser(user));
    }

    /**
     * 删除用户
     *
     * @param userIds 角色ID串
     */
    @SaCheckPermission("userList")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public R<Void> remove(@PathVariable Integer[] userIds) {
        if (ArrayUtil.contains(userIds, getUserId())) {
            return R.fail("当前用户不能删除");
        }
        return toAjax(userService.deleteUserByIds(userIds));
    }

    /**
     * 重置密码
     */
    @SaCheckPermission("userList")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public R<Void> resetPwd(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        user.setPassword(BCrypt.hashpw(user.getPassword()));
        return toAjax(userService.resetPwd(user));
    }

    /**
     * 状态修改
     */
    @SaCheckPermission("userList")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/status")
    public R<Void> status(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        return toAjax(userService.updateUserStatus(user));
    }

}
