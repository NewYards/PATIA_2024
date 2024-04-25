package sokoban;

import com.codingame.gameengine.runner.SoloGameRunner;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class SokobanMain {
    public static void main(String[] args) {

        Properties prop = new Properties();
        InputStream input = null;

        String propertyValue = null;
        try {
            input = new FileInputStream("config/config.properties");
            prop.load(input);

            // Accès aux propriétés
            propertyValue = prop.getProperty("FILE");

        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        SoloGameRunner gameRunner = new SoloGameRunner();
        gameRunner.setAgent(Agent.class);
        gameRunner.setTestCase(propertyValue);

        gameRunner.start();
    }
}
