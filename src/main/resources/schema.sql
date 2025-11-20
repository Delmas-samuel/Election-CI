-- Schema initialization for MySQL
-- Ensures the `users` table exists to prevent runtime failures when querying

CREATE TABLE IF NOT EXISTS users (
    id BINARY(16) NOT NULL PRIMARY KEY,
    numero VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role_id BIGINT NULL,
    bureau_id BINARY(16) NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
);

-- Ensure the `audit_logs` table exists (aligned with com.example.election.model.AuditLog)
CREATE TABLE IF NOT EXISTS audit_logs (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(100) NULL,
    action VARCHAR(255) NULL,
    details LONGTEXT NULL,
    ip VARCHAR(45) NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
);

-- Ensure the `pv_files` table exists (aligned with com.example.election.model.PvFile)
CREATE TABLE IF NOT EXISTS pv_files (
    id BINARY(16) NOT NULL PRIMARY KEY,
    result_id BINARY(16) NULL,
    user_id BINARY(16) NULL,
    office_id BINARY(16) NULL,
    filename VARCHAR(255) NULL,
    content_type VARCHAR(100) NULL,
    size_bytes BIGINT NULL,
    uploaded_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
);

-- Ensure the `results` table exists (aligned with com.example.election.model.Result)
CREATE TABLE IF NOT EXISTS results (
    id BINARY(16) NOT NULL PRIMARY KEY,
    bureau_id BINARY(16) NULL,
    submitted_by BINARY(16) NULL,
    submitted_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    -- Use LONGTEXT for broad MySQL/MariaDB compatibility (older versions may not support JSON type)
    votes_json LONGTEXT NOT NULL,
    signature LONGBLOB NULL,
    status VARCHAR(20) NULL,
    synced TINYINT(1) NOT NULL DEFAULT 0,
    version INT NOT NULL DEFAULT 0
);
