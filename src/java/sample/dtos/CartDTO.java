/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author User-PC
 */
public class CartDTO {

    private Map<String, TeaDTO> cart;

    public CartDTO() {
    }

    public CartDTO(Map<String, TeaDTO> cart) {
        this.cart = cart;
    }

    public Map<String, TeaDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, TeaDTO> cart) {
        this.cart = cart;
    }

    public void add(TeaDTO tea) {
        if (cart == null) {
            cart = new HashMap<>();
        }
        if (cart.containsKey(tea.getID())) {
            int quantity = cart.get(tea.getID()).getQuantity();
            tea.setQuantity(quantity + tea.getQuantity());
        }
        cart.put(tea.getID(), tea);
    }

    public void delete(String id) {
        if (cart == null) {
            return;
        }
        if (cart.containsKey(id)) {
            cart.remove(id);
        }
    }

    public void update(String id, TeaDTO tea) {
        if (cart == null) {
            return;
        }
        if (cart.containsKey(id)) {
            cart.replace(id, tea);
        }
    }
}
