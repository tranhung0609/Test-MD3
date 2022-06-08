package service;

import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements GeneralService<Product> {
    static String jdbcURL = "jdbc:mysql://localhost:3306/demo2006?useSSL=false";
    static String jdbcUsername = "root";
    static String jdbcPassword = "123456";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM product")
        ) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                products.add(new Product(id, name, price, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public void add(Product product) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO product(name, price, quantity) VALUES (?, ?, ?)")) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
        }
    }

    @Override
    public Product findById(int id) {
        List<Product> products = findAll();
        for (Product p : products) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    @Override
    public boolean update(Product product) {
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products = new ArrayList<>();
        String query = "select * from product where name like ?;";
        try (Connection conn = getConnection(); PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nameFind = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                products.add(new Product(id, nameFind, price, quantity));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    @Override
    public List<Product> findByPrice(int start, int end) {
        List<Product> products = new ArrayList<>();
        String query = "select * from product where price between ? and ?;";
        try (Connection conn = getConnection(); PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setString(1, String.valueOf(start));
            preparedStatement.setString(2, String.valueOf(end));
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nameFind = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                products.add(new Product(id, nameFind, price, quantity));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }
}
