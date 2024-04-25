package sokoban;
import java.io.*;
import java.util.ArrayList;
import java.util.Properties;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import fr.uga.pddl4j.heuristics.state.StateHeuristic;
import fr.uga.pddl4j.planners.InvalidConfigurationException;
import fr.uga.pddl4j.planners.LogLevel;
import fr.uga.pddl4j.planners.Planner;
import fr.uga.pddl4j.planners.PlannerConfiguration;
import fr.uga.pddl4j.planners.statespace.HSP;

public class Agent {
        
    public static void main(String[] args) throws InvalidConfigurationException, IOException, ParseException {

        Properties prop = new Properties();
        InputStream input = null;

        String propertyValue = null;
        input = new FileInputStream("config/config.properties");
        prop.load(input);

        // Accès aux propriétés
        propertyValue = prop.getProperty("FILE");

        // The path to the benchmarks directory
        final String benchmarks = "./pddl/";
        final String pathProblem = benchmarks + "problem/";
        String level = getLevel("./config/"+propertyValue);
        System.err.println(level);
        int res = convertisseur(level, pathProblem);
        System.err.println(res);

        // Gets the default configuration from the planner
        PlannerConfiguration config = HSP.getDefaultConfiguration();
        // Sets the domain of the problem to solve
        config.setProperty(HSP.DOMAIN_SETTING, benchmarks + "Sokoban.pddl");
        // Sets the problem to solve
        config.setProperty(HSP.PROBLEM_SETTING, pathProblem + "p"+ res + ".txt");
        // Sets the timeout allocated to the search.
        config.setProperty(HSP.TIME_OUT_SETTING, 1000);
        // Sets the log level
        config.setProperty(HSP.LOG_LEVEL_SETTING, LogLevel.INFO);
        // Sets the heuristic used to search
        config.setProperty(HSP.HEURISTIC_SETTING, StateHeuristic.Name.MAX);
        // Sets the weight of the heuristic
        config.setProperty(HSP.WEIGHT_HEURISTIC_SETTING, 1.2);

        // Creates an instance of the HSP planner with the specified configuration
        Planner planner = Planner.getInstance(Planner.Name.HSP, config);

        planner.solve();

        String solution = "DRRUUU";
        for (char c : solution.toCharArray()) System.out.println(c);
    }

    private static String getLevel(String pathjson) throws IOException, ParseException {
        Object o = new JSONParser().parse(new FileReader(pathjson));
        JSONObject j = (JSONObject) o;
        return (String) j.get("testIn");
    }

    private static int convertisseur(String level, String pathProblem)
    {
        try {

            // Creer le fichier problem
            int number = 1;
            File f = new File(pathProblem+"p"+number+".txt");
            while (f.exists()){
                number++;
                f = new File(pathProblem+"p"+number+".txt");
            }

            // Transformer le string en tableau de case
            int nbCaseWithouTtarget = 0;
            int nbCase = 0;
            int nbBox = 0;
            ArrayList<ArrayList<Case>> levelTab = new ArrayList<>();
            levelTab.add(new ArrayList<Case>());
            for (int i = 0; i < level.length(); i++) {
                if(level.charAt(i) == '$') // Box
                {
                    levelTab.get(levelTab.size()-1).add(new Case("C" + (nbCase+1),
                                                  false,
                                                  false,
                                                  false,
                                                  "B" + (nbBox),
                                                  false
                                                  ));
                    nbBox++;
                    nbCase++;
                    nbCaseWithouTtarget++;
                }
                else if(level.charAt(i) == '#')// Wall
                {
                    levelTab.get(levelTab.size()-1).add(new Case("",
                    false,
                    false,
                    true,
                    "",
                    false
                    ));
                }
                else if(level.charAt(i) == '*')// Target + Box
                {
                    levelTab.get(levelTab.size()-1).add(new Case("T" + (nbCase-nbCaseWithouTtarget),
                    false,
                    false,
                    false,
                    "B" + (nbBox),
                    true
                    ));
                    nbBox++;
                    nbCase++;
                }
                else if(level.charAt(i) == '@')// Character
                {
                    levelTab.get(levelTab.size()-1).add(new Case("C" + (nbCase),
                    true,
                    true,
                    false,
                    "",
                    false
                    ));
                    nbBox++;
                    nbCase++;
                    nbCaseWithouTtarget++;
                }
                else if(level.charAt(i) == '.')// Target
                {
                    levelTab.get(levelTab.size()-1).add(new Case("T" + (nbCase-nbCaseWithouTtarget),
                    true,
                    false,
                    false,
                    "",
                    true
                    ));
                    nbBox++;
                    nbCase++;
                }
                else if(level.charAt(i) == '+')// Character + Target
                {

                    levelTab.get(levelTab.size()-1).add(new Case("T" + (nbCase-nbCaseWithouTtarget),
                    true,
                    true,
                    false,
                    "",
                    true
                    ));
                    nbBox++;
                    nbCase++;
                }
                else if(level.charAt(i) == ' ') // Empty
                {
                    //levelTab.get(levelTab.size()-1).get(levelTab.get(levelTab.size()).size()-1).name = "C" + (nbCase+1);
                    levelTab.get(levelTab.size()-1).add(new Case("C" + (nbCase),
                    true,
                    false,
                    false,
                    "",
                    false
                    ));
                    nbBox++;
                    nbCase++;
                    nbCaseWithouTtarget++;
                }
                else if(level.charAt(i) == '\n')
                {
                    levelTab.add(new ArrayList<Case>());
                }
            }
            FileWriter fileWriter = new FileWriter(pathProblem+"p"+number+".txt", false);
            BufferedWriter writer = new BufferedWriter(fileWriter);
            writer.write("(define (problem Sokoban-"+number+ ")");
            writer.newLine();
            writer.write("(:domain Sokoban)");
            writer.write("(:objects ");
            for (int i = 0; i <= nbCaseWithouTtarget+1; i++) { writer.write("C"+i+" "); }
            writer.write("- case");
            writer.newLine();
            for (int i = nbCaseWithouTtarget; i <= nbCase+1; i++) { writer.write("T"+(i-nbCaseWithouTtarget)+" "); }
            writer.write("- target");
            writer.newLine();
            for (int i = 0; i <= nbBox+1; i++) { writer.write("B"+i+" "); }
            writer.write("- box)");
            writer.newLine();
            writer.write("(:INIT ");
            for (int i = 0; i < levelTab.size()-1; i++) {
                for (int j = 0; j < levelTab.get(i).size()-1; j++) {
                    if(!levelTab.get(i).get(j).isWalled()){
                        String name = levelTab.get(i).get(j).getName();
                        String box = levelTab.get(i).get(j).getBox();
                        if(levelTab.get(i).get(j).isFree()){writer.write("(Free "+name +") ");}
                        if(levelTab.get(i).get(j).isPusher()){writer.write("(PusherAt "+name +") ");}
                        if(box != ""){writer.write("(BoxAt "+ box+" "+name+") ");}
                        if(i>0 && !levelTab.get(i-1).get(j).isWalled())                         {writer.write("(Up "+ name+" "+levelTab.get(i-1).get(j).getName()+") ");}
                        if(i<levelTab.size() && !levelTab.get(i+1).get(j).isWalled())           {writer.write("(Down "+ name+" "+levelTab.get(i+1).get(j).getName()+") ");}
                        if(j>0 && !levelTab.get(i).get(j-1).isWalled())                         {writer.write("(Left "+ name+" "+levelTab.get(i).get(j-1).getName()+") ");}
                        if(j<levelTab.get(i).size() && !levelTab.get(i).get(j+1).isWalled())    {writer.write("(Right "+ name+" "+levelTab.get(i).get(j+1).getName()+") ");}
                    }
                }
            }
            writer.write(")");
            writer.newLine();
            writer.write("(:goal (and ");
            for (int i = 0; i < levelTab.size()-1; i++) {
                for (int j = 0; j < levelTab.get(i).size()-1; j++) {
                    if(!levelTab.get(i).get(j).isWalled()){
                        String name = levelTab.get(i).get(j).getName();
                        if(levelTab.get(i).get(j).isTarget()){writer.write("(Boxed "+ name+") ");}
                    }
                }
            }
            writer.write(")");
            writer.write(")");
            writer.newLine();
            writer.write(")");
            writer.close();
            fileWriter.close();
            return number;
        }
        catch (Exception e) {
            System.err.println(e);
            return -1;
        }
    }


}


