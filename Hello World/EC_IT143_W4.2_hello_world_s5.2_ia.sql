DROP TABLE dbo.t_hello_world;

CREATE TABLE dbo.t_hello_world
(
    hello_world_id INT IDENTITY(1,1) PRIMARY KEY,
    HelloWorld VARCHAR(50) NOT NULL
);