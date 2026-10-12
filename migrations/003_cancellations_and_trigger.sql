CREATE TABLE cancellations (
    cancel_id VARCHAR(5) PRIMARY KEY NOT NULL,
    trans_id VARCHAR(5) NOT NULL,
    cancel_date TIMESTAMP,
    FOREIGN KEY (trans_id) REFERENCES transactions (trans_id)
);

CREATE TRIGGER trg_delete_transaction_on_cancel
 AFTER INSERT ON cancellations
 FOR EACH ROW
 BEGIN
    DELETE FROM transactions
    WHERE trans_id = NEW.trans_id;
 END;