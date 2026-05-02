import mysql.connector

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="ecommerce"
)

cursor = conn.cursor()

# 1. Total Sales
query1 = """
SELECT SUM(p.price * o.quantity) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id;
"""
cursor.execute(query1)
print("Total Sales:", cursor.fetchone()[0])

# 2. Top Customers
query2 = """
SELECT u.name, SUM(p.price * o.quantity) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN products p ON o.product_id = p.product_id
GROUP BY u.name
ORDER BY total_spent DESC;
"""
cursor.execute(query2)

print("\nTop Customers:")
for row in cursor.fetchall():
    print(row)

# 3. Product Sales
query3 = """
SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;
"""
cursor.execute(query3)

print("\nProduct Sales:")
for row in cursor.fetchall():
    print(row)

conn.close()