package RERSlearner;

import com.google.common.collect.ImmutableSet;
import de.learnlib.api.SUL;

import java.io.IOException;
import java.util.Collection;
import java.util.Scanner;

/**
 * Created by rick on 17/03/2017. - Adapted by Martijn Vermeulen
 */
public class RERSExperiment {
    /**
     * Example of how to learn a Mealy machine model from one of the compliled RERS programs.
     *
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {
        Scanner input = new Scanner(System.in);

        System.out.print("Problem directory (. for current directory): ");
        String problem_dir = input.nextLine();

        System.out.print("Problem number (1-9 / 11-19): ");
        int problem_num = input.nextInt();

        // Load the System Under Learning (SUL)
        SUL<String, String> sul = new ProcessSUL(problem_dir + "/Problem" + problem_num + "/a.exe");

        Collection<String> inputAlphabet;
        System.out.println("Process set");
        // the input alphabet
        switch (problem_num) {
            case 1:
            case 2:
            case 3:
            case 11:
            case 12:
            case 13:
                inputAlphabet = ImmutableSet.of("1", "2", "3", "4", "5", "6", "7", "8", "9", "10");
                break;
            case 4:
            case 5:
            case 6:
            case 14:
            case 15:
            case 16:
                inputAlphabet = ImmutableSet.of("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15");
                break;
            case 7:
            case 8:
            case 9:
            case 17:
            case 18:
            case 19:
                inputAlphabet = ImmutableSet.of("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20");
                break;
            default:
                System.out.println("Input a valid problem number please.");
                return;
        }


        System.out.print("Default settings? - type n to edit: ");
        String default_settings = input.next();

        BasicLearner.LearningMethod LearnerMethod = BasicLearner.LearningMethod.TTT;
        BasicLearner.TestingMethod TesterMethod = BasicLearner.TestingMethod.WMethod;

        if(default_settings.equals("n")) {
            System.out.print("Learning Method (1 LStar, 2 RivestSchapire, 3 TTT - default, 4 KearnsVazirani): ");

            // enum LearningMethod { LStar, RivestSchapire, TTT, KearnsVazirani }
            int LearningMethod = input.nextInt();
            switch (LearningMethod) {
                case 1:
                    LearnerMethod = BasicLearner.LearningMethod.LStar;
                    break;
                case 2:
                    LearnerMethod = BasicLearner.LearningMethod.RivestSchapire;
                    break;
                case 3:
                    LearnerMethod = BasicLearner.LearningMethod.TTT;
                    break;
                case 4:
                    LearnerMethod = BasicLearner.LearningMethod.KearnsVazirani;
                    break;
                default:
                    break;
            }

            System.out.print("Testing Method (1 RandomWalk, 2 WMethod - default, 3 WpMethod, 4 UserQueries): ");

            int TestingMethod = input.nextInt();
            switch (TestingMethod) {
                case 1:
                    TesterMethod = BasicLearner.TestingMethod.RandomWalk;
                    break;
                case 2:
                    TesterMethod = BasicLearner.TestingMethod.WMethod;
                    break;
                case 3:
                    TesterMethod = BasicLearner.TestingMethod.WpMethod;
                    break;
                case 4:
                    TesterMethod = BasicLearner.TestingMethod.UserQueries;
                    break;
                default:
                    break;
            }


            try {
                System.out.print("saveAllHypotheses (true): ");
                boolean saveAllHypotheses = input.nextBoolean();
                BasicLearner.saveAllHypotheses = saveAllHypotheses;
            } catch (Exception e){

            }

            try {
                System.out.print("randomWalk_chanceOfResetting (0.1): ");
                float randomWalk_chanceOfResetting = input.nextFloat();
                BasicLearner.randomWalk_chanceOfResetting = randomWalk_chanceOfResetting;
            } catch (Exception e){

            }

            try {
                System.out.print("randomWalk_numberOfSymbols (300): ");
                int randomWalk_numberOfSymbols = input.nextInt();
                BasicLearner.randomWalk_numberOfSymbols = randomWalk_numberOfSymbols;
            } catch (Exception e){

            }

            try {
                System.out.print("w_wp_methods_maxDepth (2): ");
                int w_wp_methods_maxDepth = input.nextInt();
                BasicLearner.w_wp_methods_maxDepth = w_wp_methods_maxDepth;
            } catch (Exception e){

            }
        }

        try {
            BasicLearner.FINAL_MODEL_FILENAME = problem_dir + "/Problem" + problem_num + "/model";
            BasicLearner.INTERMEDIATE_HYPOTHESIS_FILENAME = problem_dir + "/Problem" + problem_num + "/hypothesis";

            System.out.println("Starting controlled experiment");
            BasicLearner.runControlledExperiment(sul, LearnerMethod, TesterMethod, inputAlphabet);
        } finally {
            if (sul instanceof AutoCloseable) {
                try {
                    ((AutoCloseable) sul).close();
                } catch (Exception exception) {
                    // should not happen
                }
            }
        }
    }
}