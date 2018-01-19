import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;

public class Main {

    public static void main(String[] args) {
        System.out.println("Hello World!");


        File file = new File("./faces/test.txt");
        PrintWriter writer_x = null;
        PrintWriter writer_y = null;


        BufferedReader reader = null;
        BufferedImage image=null;
        try {
            writer_x=new PrintWriter("X_test.txt", "UTF-8");
            writer_y=new PrintWriter("y_test.txt", "UTF-8");

            reader = new BufferedReader(new FileReader(file));

            String text = reader.readLine();
                String[] parts = text.split(" ");
            writer_y.print(parts[1]);
            image = ImageIO.read(new File(parts[0]));
            int k=0;
            for(int i=0; i<image.getHeight(); i++) {

                for (int j = 0; j <  image.getWidth(); j++) {

                    Color c = new Color(image.getRGB(j, i));
                    if(j==0 && i==0){
                        writer_x.println("");
                        writer_x.print(c.getBlue());}else{
                    writer_x.print(","+c.getBlue());}

                }
            }

            while ((text = reader.readLine()) != null){

                 parts = text.split(" ");
                writer_y.println("");

                writer_y.print(parts[1]);
                image = ImageIO.read(new File(parts[0]));
                for(int i=0; i<image.getHeight(); i++) {

                    for (int j = 0; j <  image.getWidth(); j++) {
                        Color c = new Color(image.getRGB(j, i));
                        if(j==0 && i==0){
                            writer_x.println("");
                            writer_x.print(c.getBlue());
                        }else{
                            writer_x.print(","+c.getBlue());}

                    }
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }  finally {
            try {
                if (reader != null) {
                    reader.close();
                }
                if (writer_x != null) {
                    writer_x.close();
                }
                if (writer_y != null) {
                    writer_y.close();
                }

            } catch (Exception e) {
            }
        }





    }
}
