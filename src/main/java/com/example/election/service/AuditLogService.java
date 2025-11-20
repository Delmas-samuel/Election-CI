package com.example.election.service;



import com.example.election.model.AuditLog;
import com.example.election.repository.AuditLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AuditLogService {

    private final AuditLogRepository auditLogRepository;

    /**
     * Crée un audit log lors d’une action sensible.
     */
    public AuditLog logAction(String userId, String action, String details, String ip) {
        AuditLog log = AuditLog.builder()
                .userId(userId)
                .action(action)
                .details(details)
                .ip(ip)
                .createdAt(Instant.now())
                .build();

        return auditLogRepository.save(log);
    }

    /**
     * Retourne tous les logs.
     */
    public List<AuditLog> getAllLogs() {
        return auditLogRepository.findAll();
    }

    /**
     * Recherche des logs par utilisateur.
     */
    public List<AuditLog> getLogsByUser(String userId) {
        return auditLogRepository.findAll()
                .stream()
                .filter(log -> log.getUserId().equals(userId))
                .toList();
    }

    // Wrappers to match controller method names
    public List<AuditLog> getAll() {
        return getAllLogs();
    }

    public List<AuditLog> getByUser(String userId) {
        return getLogsByUser(userId);
    }
}
