# Barcelona Airbnb Market & Pricing Analysis

A market benchmarking project for a host managing entire-apartment listings across three Barcelona districts, built around a realistic client-scoping exercise, real geographic visualization, and a validated seasonal demand finding - using SQL, Python, and Power BI.

**[Add your Power BI screenshot or dashboard walkthrough video link here]**

---

## Business Problem

A host managing standard 1-2BR entire apartments in Eixample, Gracia, and Ciutat Vella needed market-based pricing guidance but had no internal performance data of their own. Rather than assuming the scope, this project began with a short requirements-gathering exchange to define exactly what "help us price our units" should mean in practice - see the Scoping section below.

## Dataset

- **Source:** [Inside Airbnb](https://insideairbnb.com/barcelona/), Barcelona listings and calendar data (June 24, 2026 snapshot)
- **Size:** 13,354 active listings with valid pricing; 5.6M calendar availability records
- **Note:** Raw data files are not included in this repo due to size. Download from the link above and place in a `/data` folder to reproduce this analysis.

## Tools & Skills Demonstrated

| Tool | Applied For |
|---|---|
| **Python (pandas)** | Data cleaning, outlier investigation, seasonal booking-horizon-effect testing |
| **PostgreSQL** | District and host-quality pricing aggregation with median calculations |
| **Power BI** | Geographic map visualization, DAX measures, 3-page interactive dashboard |

## Project Structure

```
|-- data/                       # (not included - see Dataset section above)
|-- notebooks/
|   |-- 01_data_cleaning.ipynb      # Cleaning, outlier investigation, district/apt flagging
|   `-- 02_calendar_analysis.ipynb  # Seasonal demand analysis with horizon-effect control
|-- sql/
|   |-- 01_table_setup.sql
|   `-- 02_pricing_analysis.sql     # District and superhost pricing benchmarks
|-- powerbi/
|   `-- airbnb_barcelona_dashboard.pbix
|-- business_insights_summary.md
`-- README.md
```

## Scoping Process (Before Any Data Work)

Rather than diving straight into the dataset, the project began with a simulated client intake: the initial ask ("help us price our units") was vague, so a set of clarifying questions were drafted and answered before defining scope - covering unit location, property type, available performance data, and time horizon. This revealed the client had no tracked performance data of their own, which reframed the deliverable from "optimize your specific units" to "benchmark the market these units compete in" - a real, honest, and still valuable scope. This process is documented in full in `business_insights_summary.md`.

## Key Findings

- **District pricing varies nearly 2x** across the client's three target districts (Eixample EUR 269 median vs. Ciutat Vella EUR 131 median for entire apartments) - a single city-wide price benchmark would be misleading
- **Superhost status correlates with a ~16% higher median price** in the client's districts, alongside meaningfully higher guest ratings
- **Summer demand is genuinely higher than winter, confirmed through horizon-effect testing** - not just an artifact of how far in advance guests book, verified by comparing the same calendar months at different distances from the data snapshot

Full findings and recommendations: [business_insights_summary.md](./business_insights_summary.md)

## Dashboard Overview

The Power BI dashboard includes three pages:

1. **Neighborhood Pricing Map** - interactive geographic map of Barcelona listings, bubble-sized by median price, colored by district
2. **District & Host Quality Pricing Benchmarks** - median price by district and superhost price premium comparison
3. **Seasonal Booking Demand Analysis** - validated seasonal demand curve with documented methodology for isolating genuine seasonality from booking-horizon effect

## How to Reproduce

1. Download `listings.csv.gz` and `calendar.csv.gz` from the [Inside Airbnb Barcelona page](https://insideairbnb.com/barcelona/) and place extracted CSVs in a `/data` folder
2. Run `notebooks/01_data_cleaning.ipynb` to clean pricing data and flag client-relevant districts/property types
3. Load the cleaned listings into PostgreSQL using `sql/01_table_setup.sql`
4. Run `sql/02_pricing_analysis.sql` to reproduce the district and superhost pricing benchmarks
5. Run `notebooks/02_calendar_analysis.ipynb` to reproduce the seasonal demand analysis
6. Open `powerbi/airbnb_barcelona_dashboard.pbix` in Power BI Desktop and refresh data connections

## Data Notes & Limitations

- The calendar dataset used for seasonal analysis includes booking availability but not historical daily pricing, so this analysis measures seasonal *demand* (booking rate) as a proxy for seasonal *pricing* opportunity, not confirmed price fluctuation itself
- Because the data is a single point-in-time snapshot, raw booking-rate-by-month figures are confounded by "booking horizon effect" (nearer-term dates naturally show more bookings). This was explicitly tested and controlled for before drawing conclusions - see the business insights summary for the full methodology
- This analysis benchmarks the Barcelona market broadly; it does not include the client's own historical performance data, since none was available at time of analysis

---

*This project was built as a portfolio piece to demonstrate SQL, Python, and Power BI skills for data analyst roles, with emphasis on realistic stakeholder scoping and rigorous handling of a data confound before reporting a finding.*
