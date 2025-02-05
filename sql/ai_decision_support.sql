-- AI-Based Decision Support System

-- Stores decision rules based on company data
CREATE TABLE decision_rules (
    rule_id SERIAL PRIMARY KEY,
    rule_name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Stores AI-generated predictions for business decisions
CREATE TABLE model_predictions (
    prediction_id SERIAL PRIMARY KEY,
    rule_id INT REFERENCES decision_rules(rule_id),
    prediction_result TEXT NOT NULL,
    confidence_score DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Stores recommendations based on AI predictions
CREATE TABLE recommendations (
    recommendation_id SERIAL PRIMARY KEY,
    prediction_id INT REFERENCES model_predictions(prediction_id),
    suggested_action TEXT NOT NULL,
    applied BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Logs of past decisions and recommendations applied
CREATE TABLE decision_logs (
    log_id SERIAL PRIMARY KEY,
    recommendation_id INT REFERENCES recommendations(recommendation_id),
    decision_taken TEXT NOT NULL,
    decision_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
