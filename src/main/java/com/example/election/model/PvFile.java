package com.example.election.model;


import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "pv_files")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PvFile {

    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "result_id")
    private Result result;

    private String filename;
    private String contentType;
    private Long sizeBytes;

    @Column(columnDefinition = "TEXT")
    private String storageUrl;

    @CreationTimestamp
    private Instant uploadedAt;
}
