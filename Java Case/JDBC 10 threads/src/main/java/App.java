import java.sql.*;
import java.util.ArrayList;

public class App {
    private static ArrayList<String> Cantones = new ArrayList<>();
    private static Pool pool = new Pool("sa","sa");//pool de conexiones

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        //====================================================================================================
        //prueba de consulta 1
        //10 cantones para enviar parametros
        Cantones.add("Palmares");
        Cantones.add("Naranjo");
        Cantones.add("Poas");
        Cantones.add("Upala");
        Cantones.add("Acosta");
        Cantones.add("Aserri");
        Cantones.add("Barva");
        Cantones.add("Mora");
        Cantones.add("Terrazu");
        Cantones.add("Belen");
        long startTime = System.currentTimeMillis();
        for(int i = 9; i >= 0; i--){
            Consulta1 consulta1 = new Consulta1(Cantones.get(i),i);
            consulta1.start();
        }
        while (true){
            if(Thread.activeCount() == 2){//se puede medir el tiempo cuando ya no hay threads activos
                final long endTime = System.currentTimeMillis();
                System.out.println("Tiempo consulta 1: " + (endTime-startTime) + " ms");
                break;
            }
        }
        //final de prueba consulta 1
        //===========================================================================================================================
        //inicio prueba consulta 2
//        final long startTime = System.currentTimeMillis();
//        for(int i = 0; i < 10; i++) {
//            Consulta2 consulta2 = new Consulta2(pool,i);
//            consulta2.start();
//        }
//        pool.killPool();
//        final long endTime = System.currentTimeMillis();//se puede medir el tiempo cuando se mata el pool
//        System.out.println("Tiempo consulta 2: " + (endTime-startTime) + " ms");
        //final de prueba consulta 2
    }
}
