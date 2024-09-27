package com.microservice.payments.api.models;

import com.microservice.payments.api.models.db.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TransactionRepository extends JpaRepository<TransactionEntity, String> {
}
