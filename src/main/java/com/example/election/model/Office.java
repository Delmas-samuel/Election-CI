package com.example.election.model;


import jakarta.persistence.*;
import lombok.*;


import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "bureaux")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Office {

    @Id
    @GeneratedValue
    private UUID id;

    @Column(nullable = false, unique = true, length = 50)
    private String code;

    private String commune;
    private String departement;
    private String region;

    @OneToMany(mappedBy = "bureau")
    private Set<User> users;

    @OneToMany(mappedBy = "bureau")
    private Set<Result> results;
}

