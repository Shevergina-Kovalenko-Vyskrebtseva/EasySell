package com.example.salon1.Models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="images")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Image {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    @Column(name="name")
    private String name;
    @Column(name="original_file_name")
    private String originalFileName;
    @Column(name="size")
    private Long size;
    @Column(name="content_type")
    private String contentType;
    @Column(name="is_preview_image")
    private boolean isPreviewImage;
    @Lob
    @Column(name = "bytes", columnDefinition = "longblob")
    private byte[] bytes;

    @ManyToOne(cascade=CascadeType.REFRESH, fetch= FetchType.EAGER)
    private Product product;
}
