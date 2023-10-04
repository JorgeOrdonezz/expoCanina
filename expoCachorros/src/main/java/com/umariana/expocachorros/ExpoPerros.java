/**
 *
 * @author Jorge, Leidy, Valentina 
 */


package com.umariana.expocachorros;
import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletContext;

public class ExpoPerros{
    
    // Creamos la lista darPerros y la definimos 
  
    public static ArrayList<Perro> darPerros = new ArrayList<>();
    
    public static void guardarPerro(ArrayList<Perro> perros, ServletContext context) throws IOException {
        
       
        String relativePath = "/data/archivo.dat";
        String absPath = context.getRealPath(relativePath);
        File archivo = new File(absPath);
        
        try {
           
            FileOutputStream fos = new FileOutputStream(archivo);
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(perros);
            oos.close();
            
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al guardar los datos de perro: " + e.getMessage());
        }
    }

    // Utilizamos el Método para cargar los perros desde el archivo 
    public static ArrayList<Perro> cargarPerros(ServletContext context) throws IOException, ClassNotFoundException {
        

        String relativePath = "/data/archivo.dat";
        String absPath = context.getRealPath(relativePath);
        File archivo = new File(absPath);
        
        try {
            
            FileInputStream fis = new FileInputStream(archivo);
            ObjectInputStream ois = new ObjectInputStream(fis);
            darPerros = (ArrayList<Perro>) ois.readObject();
            ois.close();
            System.out.println("Datos de perros cargados exitosamente desde: perros.ser");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Error al cargar los datos de perros: " + e.getMessage());
        }
        return darPerros;
    }
    
      //Nos ayuda a buscar un perro por nombre de lista
    public static Perro buscarPerroPorNombre(String nombre) {
        /*for (Perro perro : listarPerros) {
                    System.out.println("Nombre: " + perro.getNombre() + ", Puntos: " + perro.getPuntos());
                }*/
        for (Perro perro : darPerros) {
            if (perro.getNombre().equals(nombre)) {
                //System.out.println("retorna perro");
                return perro; // Este nos ayuda a Retorna el perro si es que se encuentra
                
            }
        }
        return null; 
    }
    
    public static void eliminarPerro(String nombre) {
        Perro perroAEliminar = null;

        //Busca al perro dentro del array 
        for (Perro perro : darPerros) {
            if (perro.getNombre().equals(nombre)) {
                perroAEliminar = perro;
                break;
            }
        }

        
        if (perroAEliminar != null) {
            darPerros.remove(perroAEliminar);
        }
    }


    public static void eliminarContenidoArchivo(ServletContext context) throws IOException {

        
        String relativePath = "/data/datosP.txt";
        String absPath = context.getRealPath(relativePath);
        File archivo = new File(absPath);
        try {
            
            
            FileOutputStream cargar = new FileOutputStream(archivo);
            ObjectOutputStream caragado = new ObjectOutputStream(cargar);
            caragado.writeObject("");
            caragado.close();
            
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al guardar los datos de perro: " + e.getMessage());
        }

    }
    
}

