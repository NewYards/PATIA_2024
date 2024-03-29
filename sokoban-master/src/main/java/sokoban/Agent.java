package sokoban;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import fr.uga.pddl4j.planners.InvalidConfigurationException;
import fr.uga.pddl4j.planners.LogLevel;
import fr.uga.pddl4j.planners.Planner;
import fr.uga.pddl4j.planners.PlannerConfiguration;
import fr.uga.pddl4j.planners.statespace.HSP;


public class Agent {
        
    public static void main(String[] args) throws InvalidConfigurationException {
        // The path to the benchmarks directory
        final String benchmarks = "./pddl/";
        final String pathProblem = benchmarks + "problem/";
       // Gets the default configuration from the planner
        PlannerConfiguration config = HSP.getDefaultConfiguration();;
        // Sets the domain of the problem to solve
        config.setProperty(HSP.DOMAIN_SETTING, benchmarks + "domain.pddl");
        // Sets the problem to solve
        config.setProperty(HSP.PROBLEM_SETTING, pathProblem + "p01.pddl");
        // Sets the timeout allocated to the search.
        config.setProperty(HSP.TIME_OUT_SETTING, 1000);
        // Sets the log level
        config.setProperty(HSP.LOG_LEVEL_SETTING, LogLevel.INFO);
        // Sets the heuristic used to search
        // config.setProperty(HSP.HEURISTIC_SETTING, GoalCostHeuristic.Name.MAX);
        // Sets the weight of the heuristic
        config.setProperty(HSP.WEIGHT_HEURISTIC_SETTING, 1.2);
        // Creates an instance of the HSP planner with the specified configuration
        Planner planner = Planner.getInstance(Planner.Name.HSP, config);
        planner.solve();
        String solution = "DRRUUU";
        for (char c : solution.toCharArray()) System.out.println(c);
    }

    private int convertisseur(String level, String pathProblem)
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
                    nbBox++;
                    nbCase++;
                    nbCaseWithouTtarget++;
                    levelTab.get(-1).add(new Case("C" + (nbCase+1),
                                                  false,
                                                  false,
                                                  false,
                                                  "B" + (nbBox+1),
                                                  false
                                                  ));
                }
                else if(level.charAt(i) == '#')// Wall
                {
                    levelTab.get(-1).add(new Case("",
                    false,
                    false,
                    true,
                    "",
                    false
                    ));
                }
                else if(level.charAt(i) == '*')// Target + Box
                {
                    nbBox++;
                    nbCase++;
                    levelTab.get(-1).add(new Case("T" + (nbCase-nbCaseWithouTtarget+1),
                    false,
                    false,
                    false,
                    "B" + (nbBox+1),
                    true
                    ));
                }
                else if(level.charAt(i) == '@')// Character
                {
                    nbBox++;
                    nbCase++;
                    nbCaseWithouTtarget++;
                    levelTab.get(-1).add(new Case("C" + (nbCase+1),
                    true,
                    true,
                    false,
                    "",
                    false
                    ));
                }
                else if(level.charAt(i) == '.')// Target
                {
                    nbBox++;
                    nbCase++;
                    levelTab.get(-1).add(new Case("T" + (nbCase-nbCaseWithouTtarget+1),
                    true,
                    false,
                    false,
                    "",
                    true
                    ));
                }
                else if(level.charAt(i) == '+')// Character + Target
                {
                    nbBox++;
                    nbCase++;
                    levelTab.get(-1).add(new Case("T" + (nbCase-nbCaseWithouTtarget+1),
                    true,
                    true,
                    false,
                    "",
                    true
                    ));
                }
                else if(level.charAt(i) == ' ') // Empty
                {
                    nbBox++;
                    nbCase++;
                    nbCaseWithouTtarget++;
                    levelTab.get(-1).get(-1).name = "C" + (nbCase+1);
                    levelTab.get(-1).add(new Case("C" + (nbCase+1),
                    true,
                    false,
                    false,
                    "",
                    false
                    ));
                }
                else if(level.charAt(i) == '\n')
                {
                    levelTab.add(new ArrayList<Case>());
                }
                else 
                {
                    return -1;
                }
            }


            FileWriter fileWriter = new FileWriter(pathProblem+"p"+number+".txt", false);
            BufferedWriter writer = new BufferedWriter(fileWriter);
            writer.write("(define (problem Sokoban-"+number+ ")");
            writer.newLine();
            writer.write("(:domain Sokoban)");
            writer.write("(:objects ");
            for (int i = 1; i <= nbCaseWithouTtarget; i++) { writer.write("C"+i+" "); }
            writer.write("- case");
            writer.newLine();
            for (int i = nbCaseWithouTtarget; i <= nbCase; i++) { writer.write("T"+i+" "); }
            writer.write("- target");
            writer.newLine();
            for (int i = 1; i <= nbBox; i++) { writer.write("B"+i+" "); }
            writer.write("- box)");
            writer.newLine();
            writer.write("(:INIT ");
            for (int i = 0; i < levelTab.size(); i++) {
                for (int j = 0; j < levelTab.get(i).size(); j++) {
                    if(!levelTab.get(i).get(j).walled){
                        String name = levelTab.get(i).get(j).name;
                        String box = levelTab.get(i).get(j).box;
                        if(levelTab.get(i).get(j).free){writer.write("(Free "+name +") ");}
                        if(levelTab.get(i).get(j).pusher){writer.write("(PusherAt "+name +") ");}
                        if(box != ""){writer.write("(BoxAt "+ box+" "+name+") ");}
                        if(i>0 && !levelTab.get(i-1).get(j).walled)                         {writer.write("(Up "+ name+" "+levelTab.get(i-1).get(j).name+") ");}
                        if(i<levelTab.size() && !levelTab.get(i+1).get(j).walled)           {writer.write("(Down "+ name+" "+levelTab.get(i+1).get(j).name+") ");}
                        if(j>0 && !levelTab.get(i).get(j-1).walled)                         {writer.write("(Left "+ name+" "+levelTab.get(i).get(j-1).name+") ");}
                        if(j<levelTab.get(i).size() && !levelTab.get(i).get(j+1).walled)    {writer.write("(Right "+ name+" "+levelTab.get(i).get(j+1).name+") ");}
                    }
                }
            }
            writer.write(")");
            writer.newLine();
            writer.write("(:goal ");
            for (int i = 0; i < levelTab.size(); i++) {
                for (int j = 0; j < levelTab.get(i).size(); j++) {
                    if(!levelTab.get(i).get(j).walled){
                        String name = levelTab.get(i).get(j).name;
                        if(levelTab.get(i).get(j).target){writer.write("(Boxed "+ name+") ");}
                    }
                }
            }
            writer.write(")");
            writer.newLine();
            writer.close();
            return number;
        }
        catch (Exception e) {
            System.err.println(e);
            return -1;
        }
    }


}
