# Profiling and Analyzing the Yelp Dataset

## 📊 Project Overview

This project focuses on profiling and analyzing the Yelp dataset to better understand the data structure, uncover insights, and answer key business questions.

The main goal was **data exploration** — not visualization — using SQL to query, clean, and summarize the dataset.  
The dataset was sourced from [Kaggle](https://www.kaggle.com/datasets/yelp-dataset) and contains information about businesses, users, reviews, categories, and more.

---

## 🛠 Tools Used

- **SQL** (for data querying and analysis)
- **Excel** (for light inspection and cross-checking)

---

## 📂 Dataset Tables

| Table Name      | Description                             | Record Count |
|-----------------|---------------------------------------|--------------|
| `business`      | Business details                       | 10,000       |
| `user`          | User profiles                          | 10,000       |
| `review`        | User reviews on businesses            | 10,000       |
| `category`      | Business categories                    | 10,000       |
| `hours`         | Business operating hours               | 10,000       |
| `attribute`     | Business attributes (WiFi, parking, etc.) | 10,000   |
| `checkin`       | Check-in logs                          | 10,000       |
| `photo`         | Photos uploaded                        | 10,000       |
| `tip`          | User tips/comments                     | 10,000       |
| `friend`        | User friendships                       | 10,000       |
| `elite_years`   | Years when users were elite            | 10,000       |

---

## 🔍 Main Analysis & Findings

### 1️⃣ Data Profiling

- Verified record counts and unique primary/foreign keys across all tables.
- Confirmed no missing (`NULL`) values in critical `user` table columns.

### 2️⃣ Review Distribution by City

- **Top city by review count:** Las Vegas
- Cities like Montréal, Gilbert, Scottsdale also showed high activity.

### 3️⃣ Star Ratings Distribution

- Analyzed ratings across cities like Avon and Beachwood.
- Found varying distributions, e.g., Avon mostly had 3–4 stars; Beachwood had a surprising number of 5-star businesses.

### 4️⃣ User Activity

- **Top reviewers:** Gerald, Sara, Yuri (with 2000, 1629, and 1339 reviews respectively).
- No strong correlation between the number of reviews and the number of fans.

### 5️⃣ Sentiment Analysis (Keyword Search)

- Reviews mentioning **“Love”**: 1780  
- Reviews mentioning **“Hate”**: 232  
→ Positive sentiment significantly outweighs negative.

### 6️⃣ Business Status Analysis

- Compared open vs. closed businesses.
- Found that:
  - Some states only had open businesses.
  - Open restaurants had ~5x more reviews than closed ones.

### 7️⃣ Best-Performing Categories

- Among businesses with >350 reviews and high ratings (4–5 stars), **food-related categories** consistently ranked at the top (restaurants, sandwiches, meat, fruits & veggies).

---

## 💡 Key Takeaways

- The Yelp dataset is rich and structured, allowing deep business and user behavior analysis.
- Positive sentiment dominates user reviews.
- Food-related businesses dominate among high-performing and highly-rated businesses.
- Working hours and timing may play a role in determining a business's success.

---

## 📁 Files

- `Profiling_and_Analyzing_the_Yelp_Dataset.sql` → Main SQL analysis script.
- `original_dataset_files/` → (optional) Folder with original raw data (if included).
- `cleaned_dataset_files/` → (optional) Folder with cleaned/processed data (if included).

---

## 🚀 How to Use

1. Download the Yelp dataset from Kaggle.
2. Load the data into a SQL environment.
3. Run the queries in the provided `.sql` file.
4. Review and interpret the results.

---

