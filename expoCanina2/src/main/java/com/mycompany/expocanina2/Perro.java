/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 /**
 *
 * @author Jorge Andres, Leidy Cuasquer, Valentina Peñafiel
 */
package com.mycompany.expocanina2;
import java.io.Serializable;

public class Perro implements Serializable {
    
    private String nombre;
    private String raza;
    private String imagen; 
    private int puntos;
    private int edad;

    public Perro() {
    }

    public Perro(String nombre, String raza, String imagen, int puntos, int edad) {
        this.imagen = imagen;
        this.puntos = puntos;
        this.edad = edad;
        this.nombre = nombre;
        this.raza = raza;
       
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
     public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
   

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getImagen() {
        return imagen;
    }

   
    
}