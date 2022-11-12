package wind.system.controller;

import cn.dev33.satoken.secure.BCrypt;
import wind.common.annotation.Log;
import wind.common.constant.UserConstants;
import wind.common.core.controller.BaseController;
import wind.common.core.domain.R;
import wind.common.enums.BusinessType;
import wind.common.helper.LoginHelper;
import wind.common.utils.StringUtils;
import wind.system.domain.SysUser;
import wind.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 个人信息 业务处理
 *
 * @author Yu Gaoheng
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/user/profile")
public class SysProfileController extends BaseController {

    private final ISysUserService userService;

    /**
     * 个人信息
     */
    @GetMapping
    public R<Map<String, Object>> profile() {
        SysUser user = userService.selectUserById(getUserId());
        Map<String, Object> ajax = new HashMap<>();
        ajax.put("user", user);
        ajax.put("roleGroup", userService.selectUserRoleGroup(user.getUsername()));
        return R.ok(ajax);
    }

    /**
     * 修改用户
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Void> updateProfile(@RequestBody SysUser user) {
        if (StringUtils.isNotEmpty(user.getMobile())
            && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return R.fail("修改用户'" + user.getUsername() + "'失败，手机号码已存在");
        }
        if (StringUtils.isNotEmpty(user.getEmail())
            && UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
            return R.fail("修改用户'" + user.getUsername() + "'失败，邮箱账号已存在");
        }
        user.setId(getUserId());
        user.setUsername(null);
        user.setPassword(null);
        user.setAvatar(null);
        if (userService.updateUserProfile(user) > 0) {
            return R.ok();
        }
        return R.fail("修改个人信息异常，请联系管理员");
    }

    /**
     * 重置密码
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PutMapping("/updatePwd")
    public R<Void> updatePwd(@RequestBody Map<String, Object> params) {
        String newPassword = params.get("newPassword").toString();
        String oldPassword = params.get("oldPassword").toString();
        SysUser user = userService.selectUserById(LoginHelper.getUserId());
        String username = user.getUsername();
        String password = user.getPassword();
        System.out.println("password = " + password);
        System.out.println("oldPassword = " + oldPassword);
        System.out.println("newPassword = " + newPassword);
        if (!BCrypt.checkpw(oldPassword, password)) {
            return R.fail("修改密码失败，旧密码错误");
        }
        if (newPassword.equals(oldPassword)) {
            return R.fail("新密码不能与旧密码相同");
        }

        if (userService.resetUserPwd(username, BCrypt.hashpw(newPassword)) > 0) {
            return R.ok();
        }
        return R.fail("修改密码异常，请联系管理员");
    }

}