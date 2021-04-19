/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dtos;

/**
 *
 * @author User-PC
 */
public class TeaDTO {
    private String ID;
    private String name;
    private int quantity;
    private double price;

    public TeaDTO() {
    }

    public TeaDTO(String ID, String name, int quantity, double price) {
        this.ID = ID;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    public String getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }
   
}
