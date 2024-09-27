package com.microservice.payments.api.services;

import com.microservice.payments.lib.Transaction;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface TransactionService {

    Transaction findTransactionById(String id);

    List<Transaction> findTransactions(Pageable pageable);

    Long findTransactionsCount();

    Transaction createTransaction(Transaction transaction);
}
