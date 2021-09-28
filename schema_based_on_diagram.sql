CREATE TABLE patients (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(100)
);

CREATE TABLE treatments (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(20),
  name VARCHAR(100)
)

-- Many-to-many table for treatments and medical_histories
CREATE TABLE medical_treatments (
  medical_histories_id INT REFERENCES medical_histories(id),
  treatments_id INT REFERENCES treatments(id),
  PRIMARY KEY(medical_histories_id, treatments_id)
);