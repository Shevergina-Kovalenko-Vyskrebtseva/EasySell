package com.example.salon1.Repository;

import com.example.salon1.Models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findByTitleContaining(String title);
    List<Product> findByCity(String city);
    List<Product> findByTitleContainingAndCity(String title, String city);
}
