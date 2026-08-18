# Barcelona Airbnb Market & Pricing Analysis
## Business Insights Summary

**Client scenario:** A host managing standard 1-2BR entire apartments in Eixample, Gracia, and Ciutat Vella, looking for market-based pricing guidance.
**Dataset:** Inside Airbnb, Barcelona listings snapshot (June 24, 2026)
**Tools:** PostgreSQL, Python (pandas), Power BI

---

## 1. Scoping Summary

Before analysis began, the initial request ("help us price our units") was clarified into a specific, answerable scope through a short requirements-gathering exchange. Key clarifications:

- The client's units are entire apartments (not private/shared rooms) in three specific districts
- The client does not track their own performance data, so this analysis benchmarks the market rather than optimizing specific existing units
- A year-round pricing view was requested, with attention to seasonal patterns if the data supported it

This scoping step shaped the entire analysis - rather than assuming what the client needed, the deliverable was defined collaboratively before any data was touched.

---

## 2. Data Overview

- **13,354** active Barcelona listings with valid pricing (after removing ~1,900 listings with no active price, mostly unavailable/paused listings)
- **10,114** of these are entire apartments; **6,957** are entire apartments specifically in the client's three target districts
- One clear data error (a 1BR/2-guest listing priced at $10,542/night) was identified and excluded; all other high-price listings were verified as legitimate large group accommodations (12-15 bedroom "party flats"), not errors
- A supplementary calendar dataset (5.6M date-level availability records) was used for seasonal demand analysis

---

## 3. District Pricing Benchmarks

Median nightly price for entire apartments by district (most relevant to client):

| District | Median Price | Listing Count |
|---|---|---|
| Eixample | EUR 269.44 | 4,060 |
| Gracia | EUR 219.67 | 927 |
| Ciutat Vella | EUR 130.62 | 1,970 |

**Key finding:** the client's three districts span a wide pricing range - nearly double from Ciutat Vella to Eixample. A single "Barcelona price" would be misleading; pricing should be set per-district, not city-wide.

**Note on methodology:** median was used instead of average because average prices were significantly inflated by large group-accommodation outliers (12+ bedroom listings sleeping 20-35 guests). Median better reflects what a typical 1-2BR apartment actually charges.

---

## 4. Superhost Price Premium

Within the client's three districts, superhost-status listings commanded a meaningfully higher typical price:

| Host Status | Median Price | Avg Rating |
|---|---|---|
| Superhost | EUR 255.00 | 4.83 |
| Non-superhost | EUR 219.00 | 4.52 |

**Key finding:** superhost listings priced about 16% higher at the median, alongside meaningfully higher guest ratings. This suggests achieving superhost status (via response time, low cancellations, high ratings) is associated with real pricing power, not just a badge.

---

## 5. Seasonal Demand Patterns

**Important limitation:** the available calendar data included booking availability but not historical or forward-looking daily pricing, so true seasonal *pricing* could not be directly measured. Instead, seasonal *demand* (booking rate) was analyzed as a proxy.

A raw view of booking rates by calendar month showed a clear high-summer, low-winter pattern - but this could plausibly be explained by "booking horizon effect" alone (nearer-term dates naturally show more bookings simply because more time has passed for guests to book them), not genuine seasonality.

**This was tested directly** by comparing booking rates for the same calendar months at different distances from the data snapshot date. The result: June 2027 (booked 48.5%, a full year out) still showed a meaningfully higher booking rate than December 2026 (booked 16.4%, only ~5 months out) - confirming that summer demand is genuinely higher, not just an artifact of booking lead time.

**Key finding:** summer (June-July) is a confirmed high-demand period in the client's districts, and winter (November-December) is a confirmed low-demand period, independent of booking horizon. This supports seasonal pricing strategy: higher rates in summer are justified by genuine demand, not just convention.

---

## 6. Recommendations

1. **Price by district, not city-wide.** Use EUR 269 (Eixample), EUR 220 (Gracia), and EUR 131 (Ciutat Vella) as starting median benchmarks for comparable 1-2BR entire apartments, adjusting for individual unit quality and amenities.
2. **Pursue superhost status as a genuine revenue lever**, not just a badge - it correlates with an ~16% higher achievable price point in these districts.
3. **Implement seasonal pricing**, raising rates for June-July bookings and considering promotional pricing or minimum-stay adjustments for the November-December low season.
4. **Revisit this analysis with the client's own booking/revenue data** once available - this analysis benchmarks the market, but pairing it with the client's actual occupancy and pricing history would allow for unit-specific optimization rather than market-level guidance alone.

---

*Analysis conducted using PostgreSQL (pricing aggregation, outlier investigation), Python/pandas (data cleaning, seasonal horizon-effect testing), and Power BI (interactive map, dashboard, DAX measures).*
