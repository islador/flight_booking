require 'spec_helper'

describe "FlightPage" do
	subject {page}

	before do
		airport1 = Airport.create(city: "San Francisco", country: "United States of America", i_code: "SFO", name: "San Francisco International Airport", phone: 6508218211)
		airport2 = Airport.create(city: "Los Angeles", country: "United States of America", i_code: "LAX", name: "Los Angeles International Airport", phone: 6508218222)
		airline = Airline.create(name: "Virgin America", phone: 5551234567)
		flight = airline.flights.create(airline_id: airline.id, arrival: DateTime.now+(5/24.0), bus_fare: 500, eco_fare: 250, date: Date.today, departure: DateTime.now+(1/24.0), destination_airport: airport2.id, number: 202, origin_airport: airport1.id)
		flight.create_plane(bus_cap: 40, eco_cap: 122, manufacturer: "Boeing", make: "737-800", prop_type: "Jet", tail_num: 4285)
			visit root_path	
	end

	
	describe "drop down box" do
		it "should have a div of class dropdowns" do
			should have_selector('div.dropdowns')
		end

		it "should contain a select with id 'airline_select'" do
			should have_selector('select#airline_select')
		end

		it "should contain a select with id 'origin_select'" do
			should have_selector('select#origin_select')
		end

		it "should contain a select with id 'dest_select'" do
			should have_selector('select#dest_select')
		end

		it "should contain a select with id 'price_select'" do
			should have_selector('select#price_select')
		end

		it "should contain an input with id 'select_date'" do
			should have_selector('input#select_date')
		end

		it "should contain a select with id 'min_seats'" do
			should have_selector('select#min_seats')
		end
	end

	describe "flight table" do
		it "should contain a div with id 'flight_table'" do
			should have_selector('div#flight_table')
		end

		it "should render _flight_table" do
			should have_selector('tbody#flight_table_tbody')
		end

		describe "table head" do
			it "should have a th with id 'airline'" do
				should have_selector('th#airline')
			end

			it "should have a th with id 'origin'" do
				should have_selector('th#origin')
			end

			it "should have a th with id 'destination'" do
				should have_selector('th#destination')
			end

			it "should have a th with id 'departure_info'" do
				should have_selector('th#departure_info')
			end

			it "should have a th with id 'arrival_info'" do
				should have_selector('th#arrival_info')
			end

			it "should have a th with id 'seats_avail'" do
				should have_selector('th#seats_avail')
			end

			it "should have a th with id 'price'" do
				should have_selector('th#price')
			end

			it "should have a th with id 'reservation_column'" do
				should have_selector('th#reservation_column')
			end
		end

		describe "table rows" do
			it "should have a tr with id 'flight0'" do
				should have_selector('tr#flight0')
			end

			it "should have a td with id '0airline'" do
				should have_selector('td#0airline')
			end

			it "should have a td with id '0origin'" do
				should have_selector('td#0origin')
			end

			it "should have a td with id '0destination'" do
				should have_selector('td#0destination')
			end

			it "should have a td with id '0departure_info'" do
				should have_selector('td#0departure_info')
			end

			it "should have a td with id '0arrival_info'" do
				should have_selector('td#0arrival_info')
			end

			it "should have a td with id '0seats_avail'" do
				should have_selector('td#0seats_avail')
			end

			it "should have a td with id '0price'" do
				should have_selector('td#0price')
			end

			it "should have a td with id '0reservation'" do
				should have_selector('td#0reservation')
			end
		end

		describe "table columns" do
			it "should have a table column with a reserve flight button" do
				should have_selector('button.btn', text: "Reserve Flight")
			end
		end
	end
end