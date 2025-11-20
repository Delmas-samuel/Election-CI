package com.example.election.dto;



import lombok.Data;

import java.time.Instant;

@Data
public class AuditLogDTO {
    private Long id;
    private String userId;
    private String action;
    private String details;
    private String ip;
    private Instant createdAt;
}
