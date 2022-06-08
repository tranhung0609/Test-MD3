package service;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface GeneralService<T> {
    List<T> findAll();

    void add(T t) throws SQLException;

    T findById(int id);

    boolean update(T t);

    boolean delete(int id) throws SQLException;

    List<Product> findByName(String name);

    List<Product> findByPrice(int start, int end);
}
