# Maveli Mart

Maveli Mart is an all-in-one festive companion mobile application designed to simplify and elevate Onam celebrations. Powered by real-time APIs, the app connects users to traditional Kerala experiences—from curating custom Sadya feasts and purchasing fresh Pookalam flowers to tracking King Maveli's live journey across Kerala and interacting through interactive digital portals.

---

# 🛠️ Technology Stack

### Frontend

* **Flutter**
* **Dart**
* **Flutter Web**
* Responsive UI designed for web and mobile experiences.

### APIs

**The Great Coconut API**

The application dynamically consumes the following API endpoints:

| API         | Usage                                                                                                        |
| ----------- | ------------------------------------------------------------------------------------------------------------ |
| `/sadhya`   | Sadya dishes, pricing, preparation details, flavor profiles, allergens, serving order and family debate data |
| `/pookalam` | Flowers, pricing, colors, freshness, recommended layers, symmetry and Pookalam templates                     |
| `/mahabali` | Maveli's live status, location, journey progress, telemetry, checkpoints and gifts                           |
| `/games`    | Onam Trivia with categories, questions, options, correct answers, points and hints                           |

---

# Core App Architecture (Tabs 1–5)

## 1. Home & Maveli Tracker

Displays live telemetry, GPS progress, and real-time status updates of King Maveli's annual return journey.

## 2. Sadya Planner

Features a full digital menu allowing users to select traditional dishes, analyze flavor profiles, review family debate notes, and build custom banana-leaf orders.

## 3. Pookalam Store

An e-commerce flower catalog and interactive ring-builder for designing and ordering fresh Onam floral layouts.

## 4. Connect

A citizen interaction hub providing direct audio links, simulated chats, social feeds (**Maveligram**), grievance forms, and kingdom decrees.

## 5. Maveli Zone

An entertainment module offering character avatar customization, photo session tokens, event bookings, local deliveries, and augmented reality (AR) portal experiences.

---

# Tab 1: Home & Maveli Tracker

* **Celebrate Onam Banner:** Promotional welcome card introducing the central hub for Sadya planning and Pookalam shopping.
* **Curated Sadyas Link:** Quick navigation card routing directly to the Sadya feast curator.
* **Fresh Pookalams Link:** Direct navigation portal directing users to the flower store and design tools.
* **Onam Trivia Link:** Direct navigation portal to the Onam Trivia game featuring questions on Onam history, culture, traditions, and celebrations.
* **Where is Maveli? (Home Preview):** Direct navigation to Maveli Tracker Screen.
* **Maveli Live Status:** Dynamic header on the detail page displaying real-time updates (status, location.name), coordinates, and live quotes.
* **Journey Progress Timeline:** Vertical step tracker generated from the API array showing completed (visited: true) vs. upcoming waypoints along with checkpoint_progress_pct.
* **King Stats Telemetry:** Live metrics dashboard rendering real-time telemetry including energy_level, velocity (speed_kmh), and mood_factor.
* **Maveli's Stash:** Inventory list populated directly from the gifts_bag API array displaying collected traditional items along his journey.

**Note:** The Maveli Tracker screen connects dynamically to `https://onam.gdgcloudkochi.com/mahabali` API payload to parse real-time GPS coordinates, checkpoint progress states, telemetry values, and inventory arrays.

---

# Tab 2: Sadya Planner

* **Dish Feed:** Dynamic list rendered from the API displaying dishes sorted by traditional serving order (serving_order), complete with pricing (cost), descriptions, and selection controls.
* **Dish Details:** In-depth item view rendering metadata fields including preparation time (prep_time_min), calories, spiciness levels, allergen warnings, visual flavor profile meters (flavors), and a "Family Debate" quote feed (debate_comments).
* **My Sadya (Banana Leaf Summary):** Custom cart interface displaying selected dishes, add-on options (Banana Leaf, Chips, Sarkara Varatti), dish count calculations, and total pricing before placing an order.

**Note:** This module dynamically processes the unified Sadya API: `https://onam.gdgcloudkochi.com/sadhya`, array to calculate flavor profiles, sequence serving orders, and display dietary and family debate metadata.

---

# Tab 3: Pookalam Store

* **Design Templates:** Dynamic horizontal carousel powered by the Pookalam API dataset, displaying pre-set floral layouts (e.g., Thrikkakara Star, Concentric Harmony, Lotus Spiral) with layer counts, geometry types, and difficulty tiers.
* **Design Template Details:** Tapping any template opens a detail screen that dynamically cross-references template layers with flower API metadata (`recommended_layer`, colors) to compute exact flower varieties and weight requirements (100g–500g per layer). With a single tap of "Add Complete Kit to Basket," all itemized floral layers—complete with exact flower names, color specs, and calculated pricing—transfer directly to the Pookalam Cart for instant checkout.
* **Available Flowers:** Product catalog fed by the main API dataset listing traditional flower varieties (e.g., Thumba, Mukkutti, Chethi) with base prices (`cost_per_kg`) and quick-add quantity controls.
* **Flower Details:** Comprehensive item screen displaying API attributes including freshness window (`freshness_hours`), available color variants, cultural significance, and dynamic weight selectors (100g, 500g, 1kg) tied to an "Add to Basket" action.
* **Pookalam Cart:** Order summary interface calculating selected flower weights, base item totals, delivery fees, and grand total pricing prior to checkout.
* **Design Your Pookalam:** Interactive ring-builder that utilizes API layer recommendations (`recommended_layer`) and symmetry data, allowing users to select target concentric rings and assign specific flower varieties to each layer.

**Note:** This module connects dynamically `https://onam.gdgcloudkochi.com/pookalam`, API endpoints to populate inventory metadata, pricing calculations, and interactive layout rules.

---

# Tab 4: Connect

* **Call Maveli:** Audio link allowing citizens (*prajas*) to call King Maveli directly.
* **Royal Chat:** Instant messaging interface to chat and interact with King Maveli.
* **Maveligram:** Social feed displaying official updates and lighthearted posts from Maveli & team.
* **Praja Prashnangal:** Submission portal for citizens to share grievances, wishes, and traffic updates.
* **Recent Royal Decrees:** Live newsfeed listing official kingdom proclamations, public advisories, and mandates.

**Note:** All content currently uses static mock data designed for UI/UX demonstration.

---

# Tab 5: Maveli Zone

* **Customize Maveli:** Avatar customization tool to style King Maveli with rides, shades, and costumes.
* **Selfie with Maveli:** Token generator to reserve and verify photo meet-and-greet sessions at the venue.
* **Live Speech & Dance Gala:** Event reservation module to book auditorium seats for live addresses and dance shows.
* **Pathalam Express:** Delivery request portal to order regional goods and special items brought directly from Pathalam.
* **Pathalam Thaaliola:** Astrological feature generating personalized digital palm-leaf readings based on birth date and time.
* **Pathalam Yatra:** Dual-path journey portal offering in-person physical Portal Passes or live AR streaming via Pathalam View smart glasses.

**Note:** All features currently use static mock data and local state logic for UI/UX demonstration.
