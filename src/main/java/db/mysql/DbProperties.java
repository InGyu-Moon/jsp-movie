package db.mysql;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class DbProperties {
    // db.properties 위치 넣어주기
    private static final String FILE_PATH = "C:\\sistproject\\work\\team-project\\Semi-Project\\db.properties";

    private Properties properties;

    public DbProperties() {
        properties = new Properties();
        try {
            properties.load(new FileInputStream(FILE_PATH));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getUrl() {
        return properties.getProperty("db.url");
    }

    public String getUsername() {
        return properties.getProperty("db.username");
    }

    public String getPassword() {
        return properties.getProperty("db.password");
    }
}