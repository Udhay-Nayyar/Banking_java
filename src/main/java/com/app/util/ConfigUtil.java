package com.app.util;

import java.io.InputStream;
import java.util.Properties;

public class ConfigUtil {

    private static Properties properties =
            new Properties();

    static {

        try {

            InputStream input =
                ConfigUtil.class
                .getClassLoader()
                .getResourceAsStream(
                    "application.properties");

            properties.load(input);
            System.out.println("INPUT = " + input);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    public static String getProperty(
            String key) {

        return properties.getProperty(key);
    }
}