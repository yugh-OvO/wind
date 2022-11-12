package wind.system.controller;

import wind.common.annotation.Anonymous;
import wind.common.constant.Constants;
import wind.common.core.domain.R;
import wind.common.core.domain.model.LoginBody;
import wind.common.helper.LoginHelper;
import wind.system.domain.SysUser;
import wind.system.service.ISysUserService;
import wind.system.service.SysLoginService;
import wind.system.service.SysPermissionService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 登录验证
 *
 * @author Yu Gaoheng
 */
@Validated
@RequiredArgsConstructor
@RestController
public class SysLoginController {

    private final SysLoginService loginService;
    private final ISysUserService userService;
    private final SysPermissionService permissionService;

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @Anonymous
    @PostMapping("/login")
    public R<Map<String, Object>> login(@Validated @RequestBody LoginBody loginBody) {
        Map<String, Object> ajax = new HashMap<>();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
            loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return R.ok(ajax);
    }

    /**
     * 退出登录
     */
    @Anonymous
    @PostMapping("/logout")
    public R<Void> logout() {
        loginService.logout();
        return R.ok("退出成功");
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public R<SysUser> getInfo() {
        SysUser user = userService.selectUserById(LoginHelper.getUserId());
        user.setPermissions(permissionService.getMenuPermission(user));
        user.setRole(user.isAdmin() ? "admin" : "user");
        return R.ok(user);
    }

}
