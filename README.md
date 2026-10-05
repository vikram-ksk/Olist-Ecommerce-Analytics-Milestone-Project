Olist Brazilian E-Commerce Analytics — Milestone Project

1. Project Overview
Enterprise-style e-commerce analytics project using the Olist Brazilian E-Commerce Dataset. The project covers data understanding, data cleaning, Excel analysis, MySQL analytics, statistical analysis, Power BI dashboarding, AI-assisted analytics, business questions, analytical differentiation, and executive recommendations.

2. Business Problem Statement
The objective is to understand e-commerce performance across customer behaviour, revenue and payment trends, product/category contribution, seller performance, customer satisfaction, and delivery/fulfilment operations, and convert those findings into evidence-based business recommendations.

3. Dataset Information
The project uses seven mandatory datasets:
- Customers
- Orders
- Order Items
- Products
- Payments
- Reviews
- Sellers
Geolocation and category-translation datasets were excluded from the mandatory project scope.
Dataset Scale
Dataset	Rows
Customers	99,441
Orders	99,441
Order Items	112,650
Products	32,951
Payments	103,886
Reviews	99,224
Sellers	3,095

4. Tools & Technologies
- Python
- Pandas
- NumPy
- Excel
- MySQL
- Power BI
- DAX
- Power Query
- AI-assisted analytics

5. Methodology
1. Data acquisition and understanding
2. Data cleaning and validation
3. Excel analysis
4. Relational database design and SQL analysis
5. Statistical analysis
6. Power BI data modelling and dashboard development
7. AI-assisted insight generation and validation
8. Business questions and analytical differentiation
9. Executive recommendations and presentation

6. Key Findings
- One-time customers: 93,099 (96.88%)
- Repeat customers: 2,997 (3.12%)
- Average order revenue: 137.75
- Median order revenue: 86.90
- Average review score: 4.0864 / 5
- Delivery rate: 97.02%
- Average delivery delay among delayed orders: 10.62 days
- Overall documented average delivery delay: -11.8769 days
- Price–freight correlation: 0.4142
- Revenue outlier percentage: 7.9575%
  
7. Dashboard Screenshots
The completed Power BI dashboard contains seven executive analysis sections.
Executive Overview
 
Customer Intelligence
 
Revenue Intelligence
 
Product Intelligence
 
Seller Intelligence
 
Customer Experience
 
Operational Intelligence
 
8. Business Recommendations
1. Prioritize customer retention: focus on converting one-time customers into repeat customers and measure second-purchase conversion.
2. Investigate the post-purchase journey: use delivery performance and review feedback as monitoring indicators to identify barriers to repeat purchase.
3. Prioritize commercial opportunities using evidence: use regional, product, seller, and revenue contribution analysis to focus resources where measurable business impact is strongest.

9. Analytical Lens & Unique KPI
Primary analytical lens: Customer Retention & Loyalty Analyst
Unique KPI: Repeat Customer Rate / Repeat Purchase Ratio
Documented repeat customer rate: 3.12%
The analytical differentiation focuses on customer retention opportunity, revenue distribution, experience indicators, and evidence-backed actions rather than relying only on aggregate revenue KPIs.

10. AI-Assisted Analytics
AI was used to:
- Interpret existing analytical findings
- Generate alternative interpretations and counter-analysis
- Refine recommendations
- Support executive storytelling
AI-generated claims were retained only when supported by SQL, statistical analysis, or Power BI evidence.

11. Project Structure
StudentID_VIKRAM_KSK_MilestoneProject/
├── README.md
├── 01_Data_Acquisition/
├── 02_Excel/
├── 03_SQL/
│   ├── StudentID_VIKRAM_SQLScripts.sql
│   ├── DatabaseSchema.pdf
│   └── ER_Diagram.png
├── 04_Statistics/
├── 05_PowerBI/
│   ├── StudentID_VIKRAM_PowerBI.pbix
│   └── Dashboard_Screenshots/
│       ├── 01_Executive_Overview.png
│       ├── 02_Customer_Intelligence.png
│       ├── 03_Revenue_Intelligence.png
│       ├── 04_Product_Intelligence.png
│       ├── 05_Seller_Intelligence.png
│       ├── 06_Customer_Experience.png
│       └── 07_Operational_Intelligence.png
├── 06_AI_Analytics/
├── 07_Presentation/
└── 08_Final_Report/

12. Limitations
- The source statistical report documents the review dataset at 99,224 rows, while the MySQL reviews table was validated at 99,222 rows.
- The documented Mann–Whitney analysis does not include the numerical test statistic and p-value in the final report; therefore statistical significance is not claimed in the business conclusions.
- Descriptive associations are not interpreted as causal relationships without formal supporting analysis.

13. Executive Challenge
If I were the Business Head, the three immediate priorities would be:
1. Increase repeat-purchase conversion from the current 3.12% baseline.
2. Diagnose customer barriers across the post-purchase, delivery, and experience journey.
3. Direct commercial resources toward the strongest regional, product, and seller opportunities using measurable revenue and customer outcomes.
