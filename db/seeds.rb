# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
requests = Request.create([
    {title: "Monthlies-Taste", description: "Monthly taste samples for Winemakers", complete: false, due_date: Date.new(2018, 4, 17)},
    {title: "Monthlies-Lab", description: "Monthly lab samples", complete: false, due_date: Date.new(2018, 4, 17)},
    {title: "VA checks", description: "Re-check VAs on 1081 and 1092", complete: false, due_date: Date.new(2018, 4, 18)},
    {title: "V17 Trackers", description: "Test all V17 trackers for RS and VA", complete: false, due_date: Date.new(2018, 4, 19)},
    {title: "Cold checks", description: "Test cold stability for 1201 and 1202", complete: false, due_date: Date.new(2018, 4, 20)},
])
samples = Sample.create([
    {request_id: 1, tank: "1092", lot_id: "PG17RMPS01G", complete: false, is_empty: false},
    {request_id: 1, tank: "1093", lot_id: "PG17RMPS01C", complete: false, is_empty: false},
    {request_id: 1, tank: "1094", lot_id: "PG17RMPS01B", complete: false, is_empty: false},
    {request_id: 1, tank: "1095", lot_id: "PG17RMPS01A", complete: false, is_empty: false},
    {request_id: 2, tank: "1094", lot_id: "MA17RMPS01G", complete: false, is_empty: false},
    {request_id: 2, tank: "1081", lot_id: "PG17RMPS01C", complete: false, is_empty: false},
    {request_id: 2, tank: "1066", lot_id: "CS17RMPS01B", complete: false, is_empty: false},
    {request_id: 2, tank: "1061", lot_id: "CS17RMPS01A", complete: false, is_empty: false},
    {request_id: 3, tank: "1102", lot_id: "CS17RMPS01G", complete: false, is_empty: false},
    {request_id: 3, tank: "93", lot_id: "PN17RMPS01C", complete: false, is_empty: false},
    {request_id: 3, tank: "94", lot_id: "PN17RMPS01B", complete: false, is_empty: false},
    {request_id: 3, tank: "95", lot_id: "PN17RMPS01A", complete: false, is_empty: false},
    {request_id: 10, tank: "1092", lot_id: "PG17RMPS01G", complete: false, is_empty: false},
    {request_id: 10, tank: "1093", lot_id: "PG17RMPS01C", complete: false, is_empty: false},
    {request_id: 10, tank: "1094", lot_id: "PG17RMPS01B", complete: false, is_empty: false},
    {request_id: 10, tank: "1095", lot_id: "PG17RMPS01A", complete: false, is_empty: false},
])