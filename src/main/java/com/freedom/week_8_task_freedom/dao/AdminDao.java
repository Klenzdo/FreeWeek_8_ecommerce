package com.freedom.week_8_task_freedom.dao;

import com.freedom.week_8_task_freedom.model.Product;
import com.freedom.week_8_task_freedom.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {
    static Connection con = ConnectionUtil.getConnection();


    //method to check if product exists in the database
    public static boolean checkIfProductExists(String product) throws SQLException {
        boolean checks = true;
        String query = "SELECT product_id FROM productList WHERE product_name = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setString(1, product);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            checks = false;
        }
        stmt.close();
        return checks;
    }

    //Method to get the list of products from our database populating our arraylists
    public List<Product> getAllProducts() throws SQLException {
        Product product;
        List<Product> listOfProduct = new ArrayList<>();
        String query = "SELECT * FROM productList";
        PreparedStatement stmt = con.prepareStatement(query);
        ResultSet sets = stmt.executeQuery();
        while (sets.next()) {
            product = new Product(sets.getString("product_name"), sets.getDouble("price"), sets.getInt("quantity"), sets.getString("product_category"),
                    sets.getString("product_image"));
            listOfProduct.add(product);
        }
        sets.close();
        return listOfProduct;
    }


    //method to add product to the stock list of our database
    public boolean addProductToStock(Product product) throws SQLException {
        boolean checks = false;
        String query = "INSERT INTO productList (product_name, product_category, price, quantity, product_image) VALUES(?,?,?,?,?)";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setString(1, product.getProductName());
        stmt.setString(2, product.getProductCategory());
        stmt.setDouble(3, product.getPrice());
        stmt.setInt(4, product.getQuantity());
        stmt.setString(5, product.getProduct_image());
        if (checkIfProductExists(product.getProductName())) {
            stmt.executeUpdate();
            checks = true;
        }
        return checks;
    }

    //method to search product in our database table
    public Product searchProduct(String product) throws SQLException {
        Product products;
        String query = "SELECT * FROM productList WHERE product_name = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setString(1, product);
        if (!checkIfProductExists(product)) {
            ResultSet resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("product_name");
                String product_category = resultSet.getString("product_category");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String imageUrl = resultSet.getString("product_image");
                products = new Product(name, price, quantity, product_category, imageUrl);
                stmt.close();
                return products;
            }
        }
        return null;
    }


    //method to set the price of commodities
    public boolean setPriceOfProduct(double newPrice, String productName) throws SQLException {
        String query = "UPDATE productList SET price = ? WHERE product_name = ?";
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setDouble(1, newPrice);
        preparedStatement.setString(2, productName);
        boolean ok = preparedStatement.executeUpdate() > 0;
        return ok;
    }

    //method to set the quantity of product
    public boolean setQuantityOfProduct(int quantity, String productName) throws SQLException {
        String query = "UPDATE productList SET quantity = ? WHERE product_name = ?";
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setDouble(1, quantity);
        preparedStatement.setString(2, productName);
        boolean ok = preparedStatement.executeUpdate() > 0;
        return ok;
    }

    //Method to remove products from database
    public boolean removeProduct(Product product) throws SQLException {
        String productName = product.getProductName();
        String query = "DELETE FROM productList where product_name = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setString(1, productName);
        int sets = stmt.executeUpdate();
        if (sets > 0) {
            return true;
        }
        return false;
    }
}
