package com.example.salon1.Services;

import com.example.salon1.Models.Image;
import com.example.salon1.Models.Product;
import com.example.salon1.Models.User;
import com.example.salon1.Repository.ProductRepository;
import com.example.salon1.Repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {
   private final ProductRepository productRepository;
   private final UserRepository userRepository;

    public List<Product> listProducts(String title, String city) {
        if (title != null && (city == null || city.isEmpty())) {
            return productRepository.findByTitleContaining(title);
        } else if (title != null && city != null) {
            return productRepository.findByTitleContainingAndCity(title, city);
        } else if (city != null) {
            return productRepository.findByCity(city);
        } else {
            return productRepository.findAll();
        }
    }
    public void saveProduct(Principal principal, Product product, MultipartFile file1, MultipartFile file2, MultipartFile file3 ) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize()!=0) {
            image1= toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if (file2.getSize()!=0) {
            image2= toImageEntity(file2);
            product.addImageToProduct(image2);
        }
        if (file3.getSize()!=0) {
            image3= toImageEntity(file3);
            product.addImageToProduct(image3);
        }
        log.info("Saving new Product. Title: {}; Author email: {}", product.getTitle(), product.getUser().getEmail());
        Product productFromDB= productRepository.save(product);
        productFromDB.setPreviewImageId(productFromDB.getImages().get(0).getId());
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image =new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(User user,int id) {
        Product product = productRepository.findById(id)
                .orElse(null);
        if (product != null) {
            if (product.getUser().getId().equals(user.getId())) {
                productRepository.delete(product);
                log.info("Product with id = {} was deleted", id);
            } else {
                log.error("User: {} haven't this product with id = {}", user.getEmail(), id);
            }
        } else {
            log.error("Product with id = {} is not found", id);
        }
    }
    public Product getProductById(int id) {
        return productRepository.findById(id).orElse(null);
    }
}
