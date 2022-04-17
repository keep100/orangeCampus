package cn.orangecampus.entity;

/**
 * @author 16321
 */
public class User {
    private Integer id;
    private String username, password, weChatId, iconUrl, signature, email;

    public User() {}

    public User(Integer id, String username, String password, String weChatId, String iconUrl, String signature, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.weChatId = weChatId;
        this.iconUrl = iconUrl;
        this.signature = signature;
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getWeChatId() {
        return weChatId;
    }

    public void setWeChatId(String weChatId) {
        this.weChatId = weChatId;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
