package wind.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.secure.BCrypt;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import wind.common.annotation.Log;
import wind.common.constant.UserConstants;
import wind.common.core.controller.BaseController;
import wind.common.core.domain.PageQuery;
import wind.common.core.domain.Result;
import wind.common.core.page.Paging;
import wind.common.enums.BusinessType;
import wind.common.helper.LoginHelper;
import wind.common.utils.StreamUtils;
import wind.system.entity.SysRole;
import wind.system.entity.SysUser;
import wind.system.service.RoleService;
import wind.system.service.UserService;

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

    private final UserService userService;
    private final RoleService roleService;

    /**
     * 获取用户列表
     */
    @SaCheckPermission("userList")
    @GetMapping("/list")
    public Result<Paging<SysUser>> list(SysUser user, PageQuery pageQuery) {
        return Result.ok(userService.selectPageUserList(user, pageQuery));
    }

    /**
     * 根据用户编号获取详细信息
     *
     * @param userId 用户ID
     */
    @SaCheckPermission("userList")
    @GetMapping(value = {"/", "/{userId}"})
    public Result<SysUser> getInfo(@PathVariable(value = "userId", required = false) Integer userId) {
        Map<String, Object> ajax = MapUtil.newHashMap();
        List<SysRole> roles = roleService.selectRoleAll();
        ajax.put("roles", LoginHelper.isAdmin(userId) ? roles : StreamUtils.filter(roles, r -> !r.isAdmin()));
        SysUser sysUser = userService.selectUserById(userId);
        sysUser.setRoleIds(StreamUtils.toList(roleService.selectRolesByUserId(sysUser.getId()), SysRole::getId).stream().toArray(Integer[]::new));
        return Result.ok(sysUser);
    }

    /**
     * 新增用户
     */
    @SaCheckPermission("userList")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public Result<Void> add(@Validated @RequestBody SysUser user) {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUsername()))) {
            return Result.fail("新增用户'" + user.getUsername() + "'失败，登录账号已存在");
        } else if (StrUtil.isNotEmpty(user.getMobile())
                && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return Result.fail("新增用户'" + user.getUsername() + "'失败，手机号码已存在");
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
    public Result<Void> edit(@Validated @RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        if (StrUtil.isNotEmpty(user.getMobile())
                && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return Result.fail("修改用户'" + user.getUsername() + "'失败，手机号码已存在");
        } else if (StrUtil.isNotEmpty(user.getEmail())
                && UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
            return Result.fail("修改用户'" + user.getUsername() + "'失败，邮箱账号已存在");
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
    public Result<Void> remove(@PathVariable Integer[] userIds) {
        if (ArrayUtil.contains(userIds, getUserId())) {
            return Result.fail("当前用户不能删除");
        }
        return toAjax(userService.deleteUserByIds(userIds));
    }

    /**
     * 重置密码
     */
    @SaCheckPermission("userList")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public Result<Void> resetPwd(@RequestBody SysUser user) {
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
    public Result<Void> status(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        return toAjax(userService.updateUserStatus(user));
    }

}
