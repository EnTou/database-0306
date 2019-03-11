package test;

import java.io.*;

public class Test {
    public static void main(String[] args) {
        try (
                BufferedReader bufferedReader = new BufferedReader(new FileReader("c:/www.csdn.net.sql"));
                BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter("d:/csdn.txt"))
        ) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                System.out.println(line);
                bufferedWriter.write(line.replaceAll("\\s#\\s", "❤") + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
