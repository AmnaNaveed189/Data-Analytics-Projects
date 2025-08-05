CREATE DATABASE Supplychain;
USE Supplychain;
CREATE TABLE StatusLookup (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    StatusName VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO StatusLookup (StatusName) VALUES 
('Pending'), 
('Shipped'),
('Delivered'),
('Canceled'), 
('Approved'), 
('Returned');
CREATE TABLE Supplier (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    Country VARCHAR(100)
);


CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);


CREATE TABLE Warehouse (
    WarehouseID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL
);


CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Role VARCHAR(50) NOT NULL,  -- Example: Manager, Staff
    Phone VARCHAR(15),
    Email VARCHAR(100),
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);


CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    WarehouseID INT,
    Quantity INT,
    LastUpdated DATE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    ContactPerson VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50),
    Country VARCHAR(50)
);


CREATE TABLE SalesOrder (
    SalesOrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    StatusID INT,  -- Lookup table reference instead of text status
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (StatusID) REFERENCES StatusLookup(StatusID)
);

CREATE TABLE PurchaseOrder (
    PurchaseOrderID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    StatusID INT NOT NULL,
    FOREIGN KEY (StatusID) REFERENCES StatusLookup(StatusID)
);




CREATE TABLE Shipment (
    ShipmentID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseOrderID INT,
    ShipmentDate DATE,
    CarrierName VARCHAR(100),
    TrackingNumber VARCHAR(50),
    StatusID INT,
    FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder(PurchaseOrderID),
    FOREIGN KEY (StatusID) REFERENCES StatusLookup(StatusID)
);





CREATE TABLE OrderTracking (
    TrackingID INT AUTO_INCREMENT PRIMARY KEY,
    SalesOrderID INT,
    ShipmentID INT,
    StatusID INT,  -- Lookup table reference instead of text status
    EstimatedDeliveryDate DATE,
    ActualDeliveryDate DATE,
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrder(SalesOrderID),
    FOREIGN KEY (ShipmentID) REFERENCES Shipment(ShipmentID),
    FOREIGN KEY (StatusID) REFERENCES StatusLookup(StatusID)
);





INSERT INTO Supplier (SupplierName, ContactPerson, Phone, Email, Address, City, Country) VALUES
('Yoder Group', 'Catherine Hall', '446928', 'garciagabriella@example.org', 'Unit 2309 Box 0848
DPO AP 69838', 'Rodriguezhaven', 'Luxembourg'),
('Keller-Garza', 'Michelle Phillips', '576431', 'hunttaylor@example.com', '0893 Shannon Plaza
North Lindsey, PA 16590', 'Haileymouth', 'Namibia'),
('Myers and Sons', 'Michele Floyd', '903246', 'martinezkim@example.com', '692 Phillips Underpass Apt. 288
Angelicaton, PR 32277', 'Acevedofurt', 'Georgia'),
('Mills-Chandler', 'Cassie Estes', '721051', 'cookjasmine@example.net', '5487 Molina Dam Apt. 711
South Dylan, UT 14703', 'East Janice', 'Congo'),
('Cooke-Smith', 'Christopher Smith', '959095', 'arobinson@example.com', '10713 Brandon Fall
Charlesport, PA 48308', 'Port Daleberg', 'Guam'),
('Simmons-Knight', 'John Lindsey', '542094', 'xsmith@example.net', '48522 White Fields
Anthonyberg, MH 28475', 'North Timothy', 'Cayman Islands'),
('Sullivan PLC', 'Melissa Rivera', '420474', 'rogerherman@example.com', '79696 Lee Forks
Colonland, HI 31509', 'New Elizabethtown', 'San Marino'),
('West-Lee', 'Debra Robinson', '963579', 'pamelagarcia@example.org', '5182 Guerra Common
Hillmouth, MP 17878', 'Gibsonview', 'Peru'),
('Murray, Hunter and Garrett', 'Kevin Johnson', '701780', 'sierra64@example.com', 'Unit 8895 Box 3638
DPO AP 14312', 'Nguyenfort', 'Antigua and Barbuda'),
('Bennett, Stewart and Lee', 'Michael Washington', '153735', 'vellis@example.org', '01199 Douglas Falls
Andrewside, UT 12630', 'Port Emilyport', 'Monaco'),
('Williams Inc', 'Penny Anderson', '525746', 'uwalker@example.net', '603 Barrera Turnpike
Michaelhaven, PR 82323', 'Kimberlytown', 'Tokelau'),
('Powers and Sons', 'Christine Johnson', '212471', 'kristopherdavis@example.net', 'USCGC Russell
FPO AE 13927', 'Johnshire', 'Korea'),
('Webster, Irwin and Morrison', 'Michael Barton', '886592', 'gina78@example.net', '7112 Nicole Meadow
New Victorshire, OR 49616', 'Buckleyfurt', 'Congo'),
('Scott Ltd', 'Stephen Matthews', '673058', 'nicolegarza@example.com', '6291 Ryan Prairie
North Sharonbury, ID 89221', 'Danielmouth', 'Gibraltar'),
('Crawford, Olson and Garcia', 'Benjamin Harris', '212169', 'mgregory@example.net', 'Unit 3536 Box 2299
DPO AP 23524', 'Weekston', 'Niger'),
('Adams, Mcclain and Baker', 'Denise Molina', '862042', 'brianna01@example.com', '7881 David Field Suite 928
Greenside, AL 98603', 'South Jennifershire', 'Madagascar'),
('Cox, Reyes and Wallace', 'Jeremy Robbins', '310641', 'ryan42@example.com', 'PSC 6506, Box 3604
APO AP 08510', 'South Michael', 'Israel'),
('Harris-Rollins', 'Paula Contreras', '572804', 'andersongeorge@example.org', '693 Lee Viaduct
Lake Kylestad, NY 63560', 'Lake Brentfurt', 'Iceland'),
('Martin, Martinez and Green', 'Marcia Rice', '926969', 'kennedystephen@example.net', '6676 Bray Island
Michaelberg, VI 99439', 'Patriciaberg', 'Faroe Islands'),
('Patterson, Anderson and Stanley', 'Kellie Foley', '867952', 'robert52@example.com', '3293 Mcgee Roads Apt. 835
New Heatherberg, DE 31580', 'North Russellchester', 'Luxembourg'),
('Daniels, Macdonald and Ramos', 'Cynthia Payne', '444179', 'dallen@example.org', '76979 Joshua Islands
Port Adam, NY 66319', 'Karenstad', 'Niue'),
('Turner-Parrish', 'Catherine Cowan', '583057', 'moorekimberly@example.org', '274 Lauren Islands Apt. 230
Schultzburgh, MP 93673', 'North Shawn', 'Niger'),
('Austin Inc', 'Thomas Cisneros', '881141', 'longjenny@example.net', '0433 Jessica Road Suite 615
East Kristinton, TN 00897', 'Port Justinborough', 'Macao'),
('Kline-Swanson', 'Rodney Fitzpatrick', '206595', 'jackson58@example.net', 'PSC 8312, Box 3500
APO AP 71869', 'North Randy', 'Jersey'),
('Clark, Arroyo and Campos', 'Lauren Mcfarland', '764390', 'ycompton@example.org', '8647 Frances Islands
Zacharyville, MT 07082', 'New Charles', 'Antarctica (the territory South of 60 deg S)'),
('Reynolds LLC', 'Anthony Hester', '835231', 'jimwilson@example.com', '41023 Williams Alley
Williamville, OH 51656', 'Thomaschester', 'Paraguay'),
('Dalton, Smith and Cox', 'Jacob Flores', '282382', 'john47@example.com', '4150 Schroeder Forest Apt. 078
Brownchester, NJ 08196', 'Joshuamouth', 'Pakistan'),
('Davis-Jacobs', 'Desiree Martin', '922297', 'robertholloway@example.org', '4282 Sara Divide Suite 493
Vanessaburgh, OK 37587', 'Isaacfurt', 'Netherlands'),
('Spencer LLC', 'Guy Graham', '637494', 'claudia83@example.com', '997 Barnett Lodge Apt. 431
East Nicholasside, PA 46137', 'Albertview', 'Japan'),
('Rowe LLC', 'Mark Bailey', '451247', 'savagetimothy@example.com', '60477 Fowler Ford
Lintown, AK 46306', 'North Kenneth', 'Saint Martin'),
('Osborne, Barnes and Johnson', 'Haley Tapia DVM', '353392', 'downscharles@example.net', '912 Jesse Key Suite 178
Jacksonton, AZ 04993', 'West Micheletown', 'Kuwait'),
('Thornton PLC', 'Carrie Walker', '569118', 'latoya63@example.org', '033 Nicholas Streets
South Julie, AZ 86562', 'East Amanda', 'Korea'),
('Johnson-Little', 'Steven Ward', '129677', 'karlacarey@example.net', '829 Duffy Lakes Suite 312
Maryton, DE 89553', 'Markstad', 'Ukraine'),
('Robinson, Vargas and Jones', 'Thomas Duran', '674632', 'turnerlisa@example.org', '185 Dawn Ranch
Karenmouth, NV 46181', 'Tinaside', 'Solomon Islands'),
('Smith, Small and James', 'Jennifer Mueller', '820278', 'tarajones@example.com', '91262 Rodriguez Islands Apt. 505
West Crystal, KS 54508', 'Allenview', 'Nauru'),
('Williams, Ramirez and King', 'Christina Bradshaw', '343039', 'wrightraven@example.com', '458 Kevin Ridge
Parrishview, NH 43043', 'North Angela', 'Western Sahara'),
('Copeland-Porter', 'Mr. Charles Thomas', '808871', 'charlesraymond@example.org', '02667 Guerrero Island
Port David, MH 25261', 'New Elizabethview', 'India'),
('Brown, Gay and Hernandez', 'Susan Khan', '890648', 'martinezedward@example.net', '48053 Julie Harbors
Hicksport, ME 78392', 'Wilsonborough', 'Colombia'),
('Gonzales, Campbell and Munoz', 'Christie Wilcox', '381658', 'petersoneric@example.org', '744 Warren Stravenue Suite 236
South Megan, MS 41252', 'Lake Kimberly', 'Saint Lucia'),
('Robertson, Collins and Miller', 'Joel Nguyen II', '325657', 'mitchellhoward@example.net', 'USNS Alvarez
FPO AE 42856', 'Troyhaven', 'Monaco'),
('Braun, Gonzalez and Mckee', 'Amy Rodriguez', '433729', 'heatherevans@example.net', '63135 Robert Fords
Smithbury, RI 32238', 'West Michelle', 'Northern Mariana Islands'),
('Rocha PLC', 'Charles Hays', '137598', 'gsalazar@example.net', '365 Savage Land
New James, TX 86513', 'Joshuamouth', 'Sudan'),
('Gould-Thompson', 'Natasha Stephens', '953436', 'yarnold@example.net', '279 James Drive
Ayersland, GA 37026', 'Georgeside', 'Papua New Guinea'),
('Ward, Calhoun and Moran', 'Matthew Hodge', '562454', 'cynthia11@example.org', 'Unit 4972 Box 5126
DPO AA 67815', 'North Shaneland', 'Mongolia'),
('Burns Ltd', 'Miguel Nguyen', '606029', 'knewman@example.com', '12237 Ian Fork
Jamesberg, SC 64072', 'New Mariochester', 'Norfolk Island'),
('Martin Inc', 'Alexander Serrano', '949837', 'sandrasanders@example.com', '71406 Jeanne Union
Micheleside, DC 02972', 'Nathanburgh', 'Guernsey'),
('Montoya, Li and Garcia', 'Amy Roberts', '152104', 'xmcdonald@example.net', '66675 Rose Islands Suite 456
Phillipshire, NC 64854', 'East Derek', 'Azerbaijan'),
('Castro, Herrera and Jacobson', 'Sean Moore', '207514', 'kimbailey@example.org', '2945 Joshua Oval
New Charleneland, NJ 04061', 'East Dakotastad', 'French Southern Territories'),
('Mcintosh, Sims and Price', 'Mr. Willie Chavez', '145102', 'angela53@example.com', '9010 Keith Cape
Hendersontown, AL 52992', 'Englishhaven', 'Cook Islands'),
('White, Richardson and Barton', 'Todd Rice', '527087', 'noconnor@example.net', 'Unit 8928 Box 4123
DPO AA 03193', 'South Joshua', 'Bahrain'),
('Wong-Tyler', 'Betty Lewis', '168840', 'ylane@example.net', '745 Alvarado Mission Apt. 966
Vaughantown, NY 39944', 'West Andrewstad', 'Botswana'),
('Allen-Moran', 'Danielle Hawkins', '422176', 'fostercarol@example.org', '008 Ray Hills Apt. 156
East John, OH 65631', 'Lisaberg', 'Saint Lucia'),
('Lyons, Perez and Vaughn', 'Joseph Wilson', '413923', 'gsharp@example.net', '49764 Thomas Court
Bakerside, VI 20637', 'Williamstad', 'Cuba'),
('Johnson, Brown and Anderson', 'Christina Martinez', '524990', 'susansharp@example.com', '57359 John Circles
West Mariaville, AK 31766', 'Thompsonborough', 'French Guiana'),
('Hanson-Dominguez', 'Luis Sanchez', '292911', 'petersenjoshua@example.org', '3096 Tyler Ways Apt. 618
Brownfort, DC 36552', 'Kevinside', 'Gibraltar'),
('Peterson and Sons', 'Juan Lee', '460526', 'teresajones@example.com', '5513 Tiffany Turnpike Suite 792
New Aliciafurt, OR 48880', 'Villanuevaborough', 'Guatemala'),
('Scott, Lopez and Caldwell', 'Darryl Ortiz', '862855', 'john93@example.com', 'Unit 5524 Box 7616
DPO AA 90127', 'Ronaldfort', 'Samoa'),
('White-Stevenson', 'Earl Anderson', '534231', 'bwalters@example.net', '06568 Parker Squares Suite 936
Sharontown, WI 38590', 'Ryanbury', 'Saint Martin'),
('Reed, Williams and Aguilar', 'George Cardenas', '803935', 'joshua33@example.org', '637 Marcus Prairie Apt. 531
Lake Lori, LA 08732', 'New Lorichester', 'Bulgaria'),
('Morse Ltd', 'Angela Melton', '557768', 'campbellmargaret@example.com', '58436 Lauren Inlet
Lake Colton, OH 15072', 'East Douglasberg', 'Malawi'),
('Roberts-Richardson', 'Tina Lynch', '696604', 'nelsonsteven@example.net', '36584 Julie Ways Apt. 765
Kyleburgh, MI 15124', 'North Charles', 'Saint Martin'),
('Cook-Schmidt', 'Shannon Baker', '999262', 'justin98@example.com', '467 Fields Knoll
Johnsonstad, ME 74641', 'Barbaraport', 'Croatia'),
('Johnson, Hensley and Gardner', 'David Hughes', '397935', 'espinozakatelyn@example.com', '0972 Scott Trafficway Apt. 505
Bryanberg, FL 23562', 'New Carlos', 'Dominican Republic'),
('Byrd Ltd', 'Seth Hinton', '595395', 'tommy80@example.net', '1182 Curry Lights Apt. 253
New Christopher, ME 68321', 'Ruizburgh', 'Germany'),
('Curtis LLC', 'Sarah Murphy', '807695', 'kayleemoore@example.com', '684 Guerrero Square
West Andrewfurt, IN 31266', 'West Joelfurt', 'Kuwait'),
('Thomas-Lambert', 'Angela Jackson', '634874', 'gabrielerickson@example.net', '4333 Miller Mountain Apt. 960
Westside, NY 85805', 'Lake Harry', 'South Georgia and the South Sandwich Islands'),
('House, Morales and Ramirez', 'Daniel Boyd', '234301', 'williamssusan@example.com', '4722 Elizabeth Club
Port Megan, AZ 03324', 'New Monique', 'French Southern Territories'),
('Pitts Group', 'Kendra Nicholson', '128967', 'brianlewis@example.net', 'USNS Simmons
FPO AE 03797', 'West William', 'Portugal'),
('Lewis, Yang and Fuentes', 'Randy Hall', '271396', 'lnovak@example.net', '0887 Thompson Grove Suite 649
North Tracy, NE 52542', 'Lake Anthonyview', 'Albania'),
('Wood, Davis and Porter', 'Rachel Wells', '845116', 'bishopandrew@example.org', '717 Jones Centers
East Karen, SC 63425', 'Anthonyhaven', 'Cambodia'),
('Smith, Johnson and Walker', 'John Ford', '705180', 'tylercardenas@example.org', '50929 James Island Apt. 286
Deborahmouth, ME 59556', 'East Kimberly', 'Mayotte'),
('Hall-Patel', 'Charlene Martin', '524493', 'qwilliams@example.org', '8975 Miranda Rapids Suite 658
Yvetteton, MO 38016', 'Lake Thomasburgh', 'Puerto Rico'),
('Williams, Keith and Williams', 'Patrick Holland', '716759', 'smcdonald@example.com', '4725 Johnson Passage Apt. 455
Port Julie, OK 18053', 'Aprilfort', 'Tokelau'),
('Lin Ltd', 'Kevin Short', '389777', 'haysalison@example.net', '01843 Heather Ford Apt. 213
Conleyhaven, NY 47131', 'Port Tony', 'Antarctica (the territory South of 60 deg S)'),
('Thomas-Snyder', 'James Torres', '327288', 'reginaldgarcia@example.org', '472 Spencer Row Apt. 873
North Kennethland, VA 97549', 'Jameschester', 'Saint Helena'),
('Smith, Shaw and Gaines', 'Amy Walker', '453377', 'ofernandez@example.org', '71786 Shawn Rapid
Penachester, MN 54982', 'Chapmanburgh', 'Namibia'),
('Becker, Manning and Heath', 'Paul Berry', '193212', 'davisbradley@example.net', '5433 Robert Corners
Hamiltonmouth, IN 27304', 'North Nicole', 'Syrian Arab Republic'),
('Elliott and Sons', 'Robert Wells', '699038', 'andrew64@example.com', '8596 Morgan Fort
Moyerview, HI 05322', 'New Michael', 'Namibia'),
('Allison, Brown and Adkins', 'Shannon Mcdaniel', '582153', 'michellemiller@example.com', '4599 Michelle Junction
Ravenmouth, KY 89941', 'New Brian', 'Maldives'),
('Wilson, Joseph and Hart', 'Elizabeth Smith', '834209', 'tina58@example.org', 'USNS Warren
FPO AA 00922', 'West Yvette', 'Palau'),
('Mcmillan and Sons', 'Beth Luna', '721508', 'usavage@example.com', '39892 Leblanc Villages
Lake Richard, MH 41482', 'Smithville', 'Greenland'),
('Caldwell, Bailey and Davis', 'Tim Wilkins', '114076', 'jonesalyssa@example.org', '22416 Kimberly Knoll
Tylerville, MH 61565', 'North Robertfort', 'British Virgin Islands'),
('Hill, Armstrong and Maldonado', 'Kelly Riley', '760166', 'danielle89@example.net', '30088 Paul Road Suite 048
Sarahburgh, NE 79699', 'Hollyland', 'Denmark'),
('Wilson, Cohen and Dixon', 'Nathan Hernandez', '121772', 'ncoleman@example.org', '029 Laura Stravenue Apt. 371
Maryport, CO 46134', 'Port Elizabethport', 'Kenya'),
('Griffith, Hickman and Foster', 'James Hernandez', '329430', 'zramirez@example.org', '5467 Roberto Curve Apt. 344
Fieldschester, AZ 20089', 'North Daniel', 'Malaysia'),
('Kim, Farmer and Meyer', 'Debra Johnson', '499382', 'smitherin@example.com', '5518 Garcia Key
Starkton, ME 26768', 'Jordanside', 'Costa Rica'),
('Burns LLC', 'Thomas Barnes', '255543', 'ubooth@example.net', '032 Cooper Court Suite 946
Donaldside, DE 87841', 'Beltranland', 'Panama'),
('Lawrence PLC', 'Margaret Reynolds', '755908', 'deborah27@example.com', '4579 Darrell Locks
North Christopherhaven, SD 48846', 'West Amanda', 'Uganda'),
('Sheppard, Kim and Harding', 'Steve Castillo', '849394', 'ohanson@example.com', 'USNV Jones
FPO AE 81874', 'North Eric', 'Faroe Islands'),
('Austin and Sons', 'Jared Bailey', '200240', 'regina03@example.net', '1134 Katherine Knoll Apt. 733
Josephland, GU 18998', 'Jaredmouth', 'Thailand'),
('Scott-Ewing', 'Jason Moore', '256421', 'senglish@example.net', '0377 Tyler Neck
Lake Carol, WA 14597', 'West Amanda', 'Guinea-Bissau'),
('Ramirez-Wilson', 'Timothy Edwards', '754004', 'ddavis@example.org', '550 Rodgers Forest Apt. 054
Hartfort, MS 39837', 'Paynehaven', 'Uganda'),
('Diaz-Mathis', 'Kristen Lewis', '423705', 'mpena@example.org', '3469 Snyder Groves Apt. 904
Jeffreyport, MO 33452', 'Barnesville', 'Zambia'),
('Green, Villarreal and Brown', 'Claudia Smith', '671570', 'david75@example.net', '176 Jesus Mountain Apt. 949
Port Benjaminfort, OR 84276', 'New Carolyn', 'Zimbabwe'),
('Colon and Sons', 'Heidi White', '707007', 'gregory07@example.com', '629 Christopher Run
North Kayleebury, MI 56260', 'Lake Kathleen', 'Northern Mariana Islands'),
('Murray-Kramer', 'Traci Burton', '751030', 'josephlutz@example.org', '6114 Michele Mission Suite 827
Cooperborough, HI 59228', 'South Lori', 'Austria'),
('Chambers, Smith and Wade', 'Kenneth Jacobs', '988537', 'shane97@example.net', '880 Clark Lodge Suite 744
North Joseph, LA 55973', 'Michaelberg', 'Marshall Islands'),
('Evans, Washington and Miller', 'Christy Harris', '846901', 'michaelhoward@example.net', '996 Mayo Trail Suite 635
North Joel, KS 62028', 'Lake Zachary', 'Central African Republic'),
('Berger, Morales and Anderson', 'Alan Li', '360033', 'gary13@example.com', '896 Dustin Plains
Chenstad, RI 99548', 'Barrytown', 'Yemen'),
('Ryan, Gill and Smith', 'Amy Golden', '376615', 'amandahayes@example.org', '3316 Vega Plains
Ryanbury, MT 26009', 'East Darlene', 'Thailand');


INSERT INTO Product (ProductName, Description, UnitPrice, SupplierID) VALUES
('wonder', 'Method during particularly move local.', 191.99, 1),
('as', 'Mention traditional field little security arm.', 50.47, 89),
('floor', 'Bag onto part herself society.', 248.81, 89),
('seat', 'All western difference believe pattern fight.', 213.67, 35),
('indeed', 'Option peace whole difficult although discussion both.', 182.25, 66),
('TV', 'School might father step kitchen effect outside.', 90.93, 72),
('country', 'Type simply never morning several option.', 192.29, 48),
('rest', 'Teach staff reach.', 276.36, 67),
('blue', 'Real actually too significant service watch.', 452.21, 86),
('bad', 'Condition direction affect trade.', 192.16, 69),
('professor', 'Particular within window understand physical next.', 218.71, 35),
('officer', 'Lose behavior doctor adult with.', 135.96, 47),
('force', 'Deep through suffer.', 354.07, 44),
('people', 'Attack five office almost measure.', 470.4, 76),
('window', 'Few eye always ability.', 154.95, 82),
('moment', 'Civil low their public.', 62.67, 63),
('blood', 'On rock writer lose role example.', 188.91, 56),
('itself', 'Congress than bad big.', 293.97, 38),
('subject', 'Choose receive set need last expect sure.', 335.78, 96),
('act', 'Population heavy edge seat newspaper.', 491.27, 3),
('reduce', 'On natural instead describe skin care bed.', 403.96, 51),
('blood', 'Top cold decision.', 175.15, 15),
('carry', 'Already put central as.', 460.77, 73),
('maybe', 'Friend show majority list image.', 221.22, 26),
('include', 'Consider window popular beyond mention.', 196.58, 65),
('turn', 'Behavior hand people possible official.', 245.53, 45),
('note', 'Sure newspaper a spend would push.', 67.77, 75),
('despite', 'Might idea wide result but hospital.', 27.91, 13),
('a', 'Light church pressure write alone protect.', 277.53, 72),
('focus', 'Good court economic evidence.', 204.96, 56),
('call', 'Professor nature probably work.', 172.24, 63),
('chair', 'Thank be body public site current.', 94.13, 49),
('yes', 'Season major take suggest statement.', 11.92, 58),
('manager', 'Couple week energy threat interesting me she.', 58.57, 48),
('report', 'It popular piece store foreign sea.', 215.93, 15),
('because', 'Show accept night remain choice.', 429.87, 57),
('book', 'Election now some long any any much.', 264.82, 68),
('quite', 'Policy with either.', 104.59, 60),
('another', 'Really meet seek minute sing two.', 373.92, 10),
('trouble', 'Reason allow team operation process bar.', 467.25, 82),
('common', 'Sell site authority.', 393.87, 80),
('alone', 'House office east able spend discussion.', 393.86, 29),
('total', 'Media generation church son mention popular behind success.', 196.8, 95),
('contain', 'Half PM thing at security.', 252.32, 32),
('prepare', 'Program decade myself item senior call.', 99.71, 87),
('everyone', 'Data performance chance property.', 420.34, 55),
('today', 'Response better now surface far feeling big.', 215.65, 89),
('garden', 'Blood manager military beyond five arm.', 376.87, 13),
('statement', 'Line support run amount near.', 489.88, 78),
('fish', 'Blue time free mind thus meeting.', 327.43, 21),
('leg', 'Health them so close memory.', 246.66, 30),
('knowledge', 'Own entire from reach degree city garden.', 156.18, 82),
('particular', 'Or star condition card rule store.', 278.7, 47),
('like', 'Save off shake grow which.', 333.28, 77),
('look', 'Arrive stuff price western.', 142.77, 70),
('low', 'Government son affect action lawyer.', 417.33, 11),
('seem', 'Hope similar pull shake resource green.', 58.41, 5),
('walk', 'Cut message federal.', 114.5, 100),
('region', 'We contain similar measure smile weight difference.', 71.88, 57),
('owner', 'Four capital grow door voice nature.', 432.17, 6),
('available', 'Baby firm set material there century force.', 178.68, 23),
('late', 'Executive occur pass without first seat society.', 204.48, 32),
('we', 'Nearly stuff success community.', 84.72, 10),
('guy', 'Unit discuss improve or seem clear realize.', 414.23, 32),
('southern', 'Employee black PM send home.', 442.57, 89),
('study', 'Tell address discuss.', 103.23, 47),
('kitchen', 'Generation wind address parent structure information PM.', 485.98, 11),
('fall', 'Third give old PM.', 408.53, 5),
('Republican', 'Child discuss sometimes read myself.', 166.9, 37),
('throw', 'Fly together serve case ready.', 370.21, 41),
('point', 'Specific wife kid type wife.', 245.62, 47),
('phone', 'Its offer computer everything staff sister trial experience.', 117.42, 93),
('late', 'Wrong within scene name network various add.', 153.37, 42),
('include', 'Choice purpose national month research mother.', 384.04, 24),
('bed', 'Ever entire memory off class decide big ability.', 293.99, 85),
('discover', 'Drug nothing to amount ball low actually.', 124.59, 17),
('able', 'Special reality significant range memory season significant.', 354.63, 45),
('just', 'Late here Democrat go receive.', 308.45, 15),
('his', 'Number reflect shoulder agree population forget suddenly.', 172.46, 28),
('they', 'Card reach owner detail chance nothing.', 433.48, 40),
('they', 'Investment several bar car.', 438.12, 34),
('along', 'Act ability certainly debate team rest money.', 382.84, 76),
('side', 'Take media adult war investment.', 418.79, 22),
('thousand', 'Bank seek pattern involve.', 78.78, 54),
('firm', 'Laugh impact prevent performance.', 486.91, 60),
('although', 'Get heart make phone any only.', 57.2, 76),
('people', 'Believe next crime day who.', 441.44, 72),
('for', 'Edge use quickly herself charge view.', 239.65, 72),
('speak', 'Among he capital woman.', 59.66, 35),
('play', 'Popular officer three interesting minute too.', 316.03, 11),
('that', 'Into structure son age sea impact cold.', 106.65, 89),
('away', 'Garden similar by who many professor.', 33.68, 27),
('often', 'Forward least interesting fund into trial.', 266.56, 74),
('agency', 'Herself final present environmental green.', 126.02, 30),
('girl', 'Various street four much.', 469.74, 63),
('arm', 'Right nothing side thank day buy.', 200.94, 1),
('field', 'Because them his apply.', 265.78, 61),
('top', 'Each science learn become let skill.', 132.25, 98),
('discover', 'Draw herself wind contain rich finally.', 358.15, 70),
('our', 'Drive site use computer despite.', 429.45, 46);

INSERT INTO Warehouse (WarehouseName, Location, Capacity) VALUES
('Jones LLC Warehouse', 'New Wesleyberg', 5254),
('Simpson and Sons Warehouse', 'Millerfurt', 3946),
('Liu, Jackson and Shaffer Warehouse', 'Hollandshire', 2754),
('Ayala-Lee Warehouse', 'Thomasport', 4926),
('Ware PLC Warehouse', 'Lake Jamesbury', 3969),
('Spencer, West and Taylor Warehouse', 'Lake Jessicafurt', 6699),
('Washington LLC Warehouse', 'New Hollyside', 3627),
('Briggs-Jones Warehouse', 'Ryanton', 6939),
('Brown-Serrano Warehouse', 'East Tony', 2325),
('Gutierrez and Sons Warehouse', 'South Wendyborough', 2618),
('Jones Ltd Warehouse', 'South Rodneychester', 9051),
('Rodriguez PLC Warehouse', 'East Douglasbury', 8805),
('Crawford, Smith and Moore Warehouse', 'Ryanfurt', 9610),
('Stout LLC Warehouse', 'South Rebecca', 6748),
('Greene-Duncan Warehouse', 'Carrillofort', 9685),
('Hughes Ltd Warehouse', 'West Jonathanview', 6544),
('Frye Inc Warehouse', 'East Sean', 3963),
('Sampson and Sons Warehouse', 'East Kennethtown', 5041),
('Garcia Ltd Warehouse', 'Ericaberg', 2757),
('Wilcox Ltd Warehouse', 'Lake Arthur', 4792),
('Sanchez LLC Warehouse', 'East Justin', 6320),
('Benson PLC Warehouse', 'Lake Kevinhaven', 2281),
('Velasquez LLC Warehouse', 'Erinberg', 6642),
('Shaw Ltd Warehouse', 'Port Latoya', 2208),
('Nunez-Hubbard Warehouse', 'East Yolandahaven', 3862),
('Brewer-Allen Warehouse', 'New Feliciashire', 8444),
('Brown, Mcbride and Guzman Warehouse', 'Lake Erin', 1226),
('Burnett PLC Warehouse', 'Johnsontown', 5587),
('Ochoa, Beck and Meyer Warehouse', 'Larsonfort', 7190),
('Day-Lloyd Warehouse', 'Dianaton', 6365),
('Diaz-Lowe Warehouse', 'Lake Douglas', 8401),
('Carroll-Fleming Warehouse', 'Lake Ryanview', 3912),
('Daniels Inc Warehouse', 'Jenniferbury', 2777),
('Miller, Willis and Watson Warehouse', 'North Anne', 2741),
('Rogers, Michael and Hawkins Warehouse', 'North Robert', 7937),
('Yang, Sweeney and Mcgrath Warehouse', 'Elizabethville', 8309),
('Johnson, Grant and Winters Warehouse', 'Henrytown', 1248),
('Bennett Ltd Warehouse', 'Richardsonfurt', 7924),
('Bauer, Caldwell and Guerrero Warehouse', 'Sanchezland', 9354),
('Hester-Yates Warehouse', 'Lake Lauraville', 1661),
('Gallegos-Kim Warehouse', 'Anthonyshire', 9763),
('Stafford-Carr Warehouse', 'West Ryantown', 3393),
('Peterson LLC Warehouse', 'Nicolemouth', 7693),
('Pope-Valencia Warehouse', 'Ambershire', 8884),
('Murray PLC Warehouse', 'South Justin', 8429),
('Shaffer-Pratt Warehouse', 'Richardhaven', 4097),
('Ford Group Warehouse', 'East Benjamin', 8010),
('Rivers-Rhodes Warehouse', 'Port Hollyborough', 6030),
('Woodard-Harrington Warehouse', 'Brooksburgh', 9937),
('Ross, Shelton and Horn Warehouse', 'Gillespiemouth', 7954),
('Mullins-Miller Warehouse', 'Danielmouth', 2556),
('Hernandez-Moon Warehouse', 'West Glennview', 1418),
('Rogers-Gomez Warehouse', 'North Amber', 6861),
('Franklin LLC Warehouse', 'Haleyfurt', 4503),
('Wells, Frost and Carr Warehouse', 'Castilloside', 3602),
('Flores-Huynh Warehouse', 'Onealview', 9516),
('Benson, Wilson and Page Warehouse', 'Rogersbury', 4062),
('Jimenez, Cline and Mathews Warehouse', 'Ronaldhaven', 3069),
('Schneider LLC Warehouse', 'Port Karen', 7189),
('White-Phelps Warehouse', 'Lake Lauren', 6211),
('Jennings-Cook Warehouse', 'Douglasport', 9584),
('Perez-Jones Warehouse', 'East Michaelbury', 3888),
('Miller, Robinson and Dixon Warehouse', 'Lake Megan', 1899),
('Harris, Griffin and Williams Warehouse', 'North Caitlin', 2999),
('Allen, Ball and Mack Warehouse', 'East Lauren', 6172),
('Spence, Soto and Sharp Warehouse', 'South Michael', 7930),
('Harvey, Hoffman and Ford Warehouse', 'Scottstad', 1860),
('Hoffman-Henderson Warehouse', 'Gibsonport', 7674),
('Powell-Hudson Warehouse', 'South Cynthiaberg', 7070),
('Harris and Sons Warehouse', 'Kimberlyport', 6687),
('Evans and Sons Warehouse', 'Jessicafort', 9676),
('Baker, Wade and Wright Warehouse', 'Tylerside', 2154),
('Webb, Becker and Phillips Warehouse', 'North Donald', 6812),
('Ferguson-Guerra Warehouse', 'Port William', 5553),
('Miller Ltd Warehouse', 'Priceberg', 6807),
('Nolan, Cline and Turner Warehouse', 'West Brian', 7725),
('Buchanan-Brown Warehouse', 'North Scott', 7252),
('Pruitt-Miller Warehouse', 'New Jeffrey', 1343),
('Briggs-Ferguson Warehouse', 'Melissaberg', 3257),
('Johnson and Sons Warehouse', 'Amandabury', 6586),
('Haley-Wright Warehouse', 'West Leahtown', 7565),
('Miller-Flores Warehouse', 'Davismouth', 3501),
('Odonnell, Blair and Craig Warehouse', 'South Sylvia', 8331),
('Bryant, Richards and Reed Warehouse', 'Port Marvinchester', 2394),
('Fernandez, Yu and Romero Warehouse', 'Port Brooke', 4123),
('Mcneil, Johnson and Moody Warehouse', 'Justinburgh', 4821),
('Johnson Ltd Warehouse', 'South Lindsay', 1960),
('Maldonado, Ellis and Clark Warehouse', 'East Adam', 8098),
('Curtis-Ferrell Warehouse', 'East Bryanfurt', 9392),
('Herrera, Morris and Frazier Warehouse', 'Port Kenneth', 9738),
('Vega Ltd Warehouse', 'Cynthiaberg', 2319),
('Greene LLC Warehouse', 'Burkeville', 2435),
('Diaz-Jackson Warehouse', 'Schmittport', 5720),
('Gardner, Edwards and Sanders Warehouse', 'Loweshire', 4222),
('Williams, Turner and Mathis Warehouse', 'West Tanya', 9242),
('Oneal LLC Warehouse', 'East Colleen', 9711),
('Pollard Inc Warehouse', 'Jakeland', 9256),
('Mullins, Reed and Mccarthy Warehouse', 'Riverafort', 7305),
('Wise, Walton and Gonzales Warehouse', 'Reedchester', 4472),
('Murphy, Walker and Lindsey Warehouse', 'West Jessica', 7014);

INSERT INTO Employee (EmployeeName, Role, Phone, Email, WarehouseID) VALUES
('Robert Phelps', 'Manager', '+1-529-232-4851x2881', 'toddphilip@example.com', 24),
('Ariel Roberts', 'Staff', '802-674-7327', 'meganboyer@example.com', 41),
('Christopher Walsh', 'Staff', '561-619-1533x00691', 'hutchinsonjimmy@example.org', 39),
('Erika James', 'Staff', '333-838-6377x47549', 'benjaminterry@example.com', 61),
('Joshua Morgan', 'Manager', '001-259-922-2000', 'warren99@example.com', 86),
('Sherri Aguilar', 'Staff', '001-925-233-8112x219', 'colejoshua@example.org', 41),
('Johnny Wallace', 'Manager', '817-226-6748x4222', 'lauren37@example.com', 67),
('Anna Roberts', 'Staff', '350.432.3121', 'jamesmcdonald@example.org', 44),
('Jasmine Harris', 'Manager', '(723)840-3089x301', 'uweaver@example.org', 56),
('Sara Reyes', 'Manager', '001-830-880-4854x9259', 'amy33@example.org', 79),
('Darlene Stephens', 'Staff', '(556)493-4959x616', 'bonnie98@example.com', 45),
('Todd Kelley', 'Staff', '+1-431-869-7859x1900', 'jacob15@example.org', 11),
('Tina Clark', 'Staff', '001-817-547-0658', 'orodriguez@example.com', 18),
('Edward Leon', 'Manager', '960-268-0545x495', 'rbaker@example.com', 63),
('Peter Hall', 'Staff', '307-686-9251x231', 'hpowers@example.net', 80),
('Laura Allen', 'Staff', '001-521-557-6680x03142', 'julie84@example.org', 51),
('Ellen Thomas', 'Manager', '496-557-9743', 'david57@example.net', 83),
('Donna Torres', 'Staff', '274-943-0540x10131', 'herringandrew@example.org', 56),
('Jennifer Taylor', 'Manager', '(823)790-2472x820', 'afranco@example.net', 79),
('Matthew Daniels', 'Staff', '(265)509-8882', 'barnesanthony@example.net', 15),
('Wanda Charles', 'Manager', '362-603-7253', 'harrisryan@example.org', 45),
('Sonya Barnes', 'Staff', '875.401.6308x1104', 'betty84@example.net', 73),
('Charlene Esparza', 'Staff', '6224735175', 'khanjoshua@example.net', 61),
('Angel Tran', 'Staff', '338.968.2660', 'ricky84@example.org', 19),
('Joseph Williams', 'Staff', '407-341-9545x818', 'christopherdean@example.net', 10),
('Jennifer Sanders', 'Manager', '+1-811-512-9875x55829', 'mcculloughraymond@example.org', 37),
('Tanner Davis', 'Staff', '+1-307-729-6285', 'ebell@example.com', 29),
('Jennifer Holt', 'Staff', '001-959-421-3001', 'damon62@example.com', 39),
('Austin Hunter', 'Staff', '001-620-996-0843x4768', 'davisjames@example.net', 7),
('Daniel Gonzalez', 'Manager', '(616)348-0205x260', 'jeffreyhoward@example.org', 66),
('Alyssa Griffin', 'Staff', '(207)459-7438x6545', 'carmenthomas@example.com', 24),
('Monique Davis', 'Manager', '851-344-4591', 'brandonphillips@example.net', 28),
('Jamie Marshall', 'Staff', '+1-684-584-9478', 'hallrodney@example.org', 92),
('Tracey King', 'Staff', '539.971.0678', 'michael56@example.org', 50),
('Peter Barnes', 'Staff', '615.501.0364x310', 'melanie00@example.com', 18),
('Jenna Myers', 'Staff', '720.371.8939', 'maldonadobethany@example.net', 55),
('Bryan Howard', 'Staff', '687-930-9773x8123', 'tammyrobinson@example.net', 64),
('Angela Maldonado', 'Staff', '001-745-877-1194', 'jessica97@example.net', 43),
('Dale Alvarado', 'Manager', '+1-289-726-6702x4063', 'alexandriajohnson@example.com', 50),
('Jessica Simpson', 'Staff', '224.911.5006x2709', 'shellyibarra@example.com', 67),
('Robert Martinez', 'Staff', '822-764-4384x71700', 'wcantu@example.net', 3),
('Rebekah Jenkins', 'Staff', '001-678-538-0320', 'tmoore@example.net', 87),
('Emma Chavez', 'Manager', '(242)683-3011', 'meyerkristin@example.net', 75),
('Michael Christensen', 'Manager', '(467)284-9812', 'melissacase@example.org', 2),
('Chelsea Rollins', 'Manager', '001-809-245-5105x0404', 'hawkinschristopher@example.org', 42),
('Cathy Williams', 'Manager', '7035999139', 'erik69@example.com', 72),
('Steven Mcdaniel', 'Staff', '001-338-816-8960', 'debra11@example.org', 81),
('Michelle Johnson', 'Manager', '823.408.1979x5499', 'david86@example.net', 61),
('Paul Chavez', 'Manager', '265-620-2257', 'mariesmith@example.com', 22),
('Jessica Hull', 'Manager', '566-527-2464x439', 'josephevans@example.net', 72),
('Eric Peters', 'Staff', '(862)468-2343x398', 'dsanchez@example.net', 58),
('Karen Hardy', 'Manager', '+1-458-571-2127x73822', 'brooke46@example.net', 52),
('Cynthia Rice', 'Manager', '001-948-344-8231x622', 'allison77@example.net', 51),
('Miguel Baker', 'Manager', '767.369.1009x556', 'hmedina@example.net', 63),
('Bruce Bowman', 'Manager', '(558)284-2650', 'david34@example.org', 62),
('Amanda Morton', 'Staff', '2334984531', 'sharon68@example.org', 49),
('Julie Marquez', 'Manager', '(362)290-7656', 'brandonpeterson@example.com', 72),
('Timothy Rose', 'Manager', '+1-551-502-6359', 'watsonalexis@example.org', 60),
('Danny Patrick', 'Manager', '216-579-4437x00533', 'stephen24@example.com', 8),
('Gary Morgan', 'Manager', '383-721-0192', 'millerpatricia@example.net', 12),
('Charles Thomas', 'Manager', '001-640-687-4581x259', 'kerry13@example.net', 95),
('Patricia Brown', 'Manager', '589-658-9464x762', 'tyler17@example.org', 90),
('Erin Sutton', 'Manager', '4852381217', 'schultzmiranda@example.org', 69),
('Juan Johnson', 'Staff', '974-376-8301x18744', 'karencampbell@example.org', 14),
('Mary Arnold', 'Staff', '354.964.1203', 'richardsantiago@example.net', 22),
('Heidi Wilson', 'Staff', '001-646-761-1469x7424', 'leekathryn@example.net', 31),
('John Harvey MD', 'Manager', '001-457-245-4298x097', 'fernandezthomas@example.net', 100),
('Stephanie Perry', 'Staff', '456-939-4231x07636', 'ekane@example.com', 96),
('Christopher Hill', 'Staff', '274.863.4904', 'angelajohnson@example.com', 85),
('Heather Hart', 'Manager', '001-466-499-1096x24007', 'murillomegan@example.net', 11),
('Johnny Wright', 'Staff', '4914027299', 'kelly78@example.net', 93),
('Brian Payne', 'Staff', '001-740-778-0448', 'ortizevan@example.net', 99),
('Michael Garcia', 'Staff', '001-515-867-8533x54683', 'bmartinez@example.net', 36),
('Susan Garza', 'Staff', '4209393573', 'shelia95@example.org', 51),
('Ronald Collins', 'Staff', '676.827.8407x57963', 'smithchristopher@example.com', 69),
('Sheila Wallace', 'Manager', '001-326-502-7916x78333', 'samanthamedina@example.org', 93),
('Tony Gordon', 'Staff', '(988)666-1975x796', 'williamsdaniel@example.org', 46),
('Frederick Graham', 'Manager', '+1-758-509-5731x8324', 'mccarthykaren@example.com', 67),
('Michelle Burgess', 'Staff', '797.444.8450', 'marcgallagher@example.org', 59),
('Robin Jenkins', 'Staff', '633-305-4407x164', 'barbara77@example.org', 90),
('Rachel Hill', 'Staff', '(298)809-2925x25419', 'biancapage@example.net', 40),
('Roger Martin', 'Staff', '419.631.0784x51877', 'nicholsmaria@example.com', 62),
('Daniel Walls', 'Staff', '001-707-604-7508x421', 'petersjon@example.com', 39),
('Daniel Estes', 'Manager', '565-447-2009x9322', 'shawnleblanc@example.org', 15),
('Eric Diaz', 'Manager', '+1-373-570-4003x56368', 'frederick15@example.com', 59),
('Tiffany Lyons DVM', 'Staff', '276.647.5016x52298', 'nchan@example.org', 50),
('Michelle Lowe', 'Manager', '5279268940', 'timothy40@example.net', 95),
('John Lopez', 'Manager', '(999)202-2293x6231', 'ubeltran@example.org', 30),
('David Nichols', 'Manager', '805.355.5759', 'efreeman@example.net', 9),
('Melissa Montgomery', 'Manager', '001-319-793-8402x4879', 'jessica89@example.com', 17),
('Dawn Perez', 'Manager', '358.890.8029x307', 'benjamin16@example.com', 15),
('Michael Cline', 'Manager', '(475)527-2044x145', 'vanessanelson@example.org', 51),
('Eric Smith', 'Staff', '(592)948-1433x4029', 'brownbilly@example.net', 33),
('Vicki Bailey', 'Manager', '+1-408-304-8727x0396', 'anthony36@example.org', 53),
('Jason Bailey', 'Manager', '811-212-9334', 'maciaspaula@example.com', 95),
('Melissa Wise', 'Manager', '458.578.4615', 'kim06@example.org', 74),
('Janice Williamson', 'Staff', '751.709.9673', 'diane92@example.com', 91),
('Lisa Weiss', 'Staff', '3544626980', 'holtkristen@example.org', 83),
('Ellen Alvarez', 'Staff', '+1-690-687-5691x7872', 'williamsbrenda@example.com', 63),
('Laura Wolfe', 'Manager', '863.387.7129x11304', 'robert03@example.org', 82);

INSERT INTO Inventory (ProductID, WarehouseID, Quantity, LastUpdated) VALUES
(35, 84, 222, '2024-09-11 11:16:15'),
(98, 93, 54, '2024-03-24 06:14:03'),
(4, 1, 58, '2024-09-28 04:46:34'),
(95, 39, 829, '2024-09-23 04:17:00'),
(9, 46, 146, '2025-01-05 00:27:44'),
(73, 87, 833, '2025-03-01 06:18:52'),
(52, 72, 680, '2024-11-03 13:41:55'),
(85, 70, 90, '2024-07-10 20:20:50'),
(68, 83, 729, '2024-03-30 01:22:25'),
(57, 10, 93, '2024-11-24 13:50:15'),
(34, 14, 375, '2024-06-01 09:29:59'),
(47, 67, 329, '2024-06-05 18:02:53'),
(17, 65, 67, '2024-08-15 04:38:05'),
(14, 73, 384, '2024-09-21 03:20:54'),
(74, 30, 138, '2024-06-09 05:22:19'),
(4, 37, 739, '2024-12-11 01:19:59'),
(74, 37, 150, '2024-03-16 13:26:01'),
(95, 14, 407, '2024-06-24 19:41:24'),
(86, 56, 954, '2024-08-12 01:21:56'),
(52, 69, 684, '2024-06-24 10:22:49'),
(76, 87, 224, '2025-01-16 05:29:56'),
(9, 13, 603, '2024-10-04 14:24:15'),
(36, 89, 273, '2024-06-09 01:26:43'),
(14, 49, 672, '2024-06-07 17:14:13'),
(86, 14, 977, '2024-04-28 21:18:50'),
(35, 100, 223, '2025-03-01 07:55:29'),
(38, 99, 720, '2024-07-13 13:03:28'),
(100, 7, 987, '2024-03-02 15:55:24'),
(82, 26, 32, '2024-10-16 22:19:31'),
(34, 69, 64, '2024-08-07 00:48:05'),
(52, 13, 328, '2024-12-30 17:27:57'),
(57, 97, 963, '2024-06-21 17:17:47'),
(35, 4, 527, '2024-03-21 20:39:16'),
(50, 56, 368, '2024-08-19 03:36:02'),
(47, 8, 98, '2024-05-17 16:01:05'),
(33, 81, 549, '2024-12-25 04:32:38'),
(9, 5, 869, '2024-09-11 16:12:48'),
(3, 62, 989, '2024-10-10 09:17:54'),
(52, 8, 77, '2025-01-10 04:45:26'),
(15, 78, 434, '2024-04-20 10:24:24'),
(71, 65, 750, '2024-11-21 05:05:03'),
(17, 14, 873, '2024-04-02 15:43:53'),
(30, 60, 733, '2024-08-12 06:46:16'),
(34, 94, 220, '2024-07-20 21:16:41'),
(55, 82, 956, '2024-06-21 17:54:11'),
(40, 40, 101, '2025-02-13 06:31:46'),
(38, 38, 178, '2024-03-15 06:30:53'),
(7, 7, 610, '2025-01-09 22:13:08'),
(28, 85, 304, '2024-12-05 08:15:30'),
(4, 35, 135, '2024-08-19 08:43:23'),
(18, 32, 705, '2024-10-30 21:54:51'),
(59, 59, 539, '2024-08-05 21:13:56'),
(50, 69, 716, '2025-01-29 07:03:37'),
(59, 56, 547, '2024-11-27 19:58:07'),
(81, 18, 370, '2024-03-11 08:52:15'),
(73, 4, 568, '2024-03-08 18:27:25'),
(74, 17, 488, '2025-02-16 07:44:16'),
(76, 96, 105, '2024-03-19 11:41:22'),
(78, 92, 658, '2024-08-05 22:28:48'),
(89, 76, 133, '2024-11-16 16:06:49'),
(23, 68, 841, '2024-08-07 19:28:22'),
(17, 8, 979, '2024-09-13 08:40:09'),
(96, 32, 306, '2025-01-13 17:56:50'),
(77, 33, 869, '2024-05-10 05:05:06'),
(81, 71, 519, '2025-02-16 11:39:08'),
(99, 87, 603, '2024-04-16 07:18:09'),
(89, 65, 551, '2024-09-13 08:19:36'),
(93, 77, 181, '2024-08-10 09:42:31'),
(87, 84, 831, '2024-08-10 00:31:19'),
(68, 68, 708, '2024-06-20 02:34:41'),
(40, 90, 208, '2024-03-04 17:22:23'),
(93, 72, 630, '2024-03-29 02:29:12'),
(28, 30, 220, '2024-12-21 04:51:20'),
(38, 25, 560, '2024-10-03 09:44:00'),
(20, 48, 823, '2024-12-25 06:35:12'),
(76, 10, 918, '2024-06-27 13:52:21'),
(80, 89, 397, '2025-01-17 03:20:49'),
(59, 65, 378, '2024-04-22 02:14:56'),
(83, 52, 87, '2025-02-23 11:26:42'),
(61, 97, 938, '2025-02-12 01:27:12'),
(100, 30, 571, '2024-09-26 16:04:01'),
(94, 64, 943, '2024-09-21 07:51:33'),
(48, 4, 238, '2024-03-10 14:05:29'),
(19, 20, 507, '2024-03-05 11:36:01'),
(9, 4, 511, '2024-04-03 04:49:48'),
(8, 70, 906, '2024-03-11 20:16:43'),
(100, 92, 46, '2024-07-07 16:46:10'),
(66, 21, 705, '2025-02-09 01:07:00'),
(48, 74, 769, '2024-11-08 10:39:49'),
(86, 41, 113, '2025-02-27 12:01:28'),
(77, 47, 623, '2024-10-01 11:01:00'),
(58, 37, 419, '2024-11-08 03:40:59'),
(53, 4, 342, '2024-06-02 03:39:31'),
(98, 58, 492, '2024-04-19 01:44:55'),
(3, 41, 516, '2025-02-11 01:27:32'),
(53, 36, 170, '2024-12-08 16:59:56'),
(96, 25, 659, '2025-01-24 22:19:59'),
(14, 87, 262, '2024-07-26 23:55:01'),
(28, 99, 676, '2025-02-22 15:10:24'),
(32, 41, 276, '2024-08-22 18:21:53');

INSERT INTO Employee (EmployeeName, Role, Phone, Email, WarehouseID) VALUES
('Matthew Johnson', 'Staff', '771241', 'tmcgee@example.com', 77),
('David Ellis PhD', 'Manager', '654595', 'gamblejason@example.net', 21),
('Natasha Foster', 'Staff', '973815', 'christy09@example.org', 44),
('Victoria Greene', 'Manager', '753892', 'mcclainjennifer@example.com', 53),
('Crystal Edwards', 'Manager', '664525', 'dannychapman@example.com', 75),
('Scott Roberts', 'Staff', '584461', 'mariamiranda@example.com', 29),
('Marc Porter', 'Staff', '901590', 'millerrobert@example.com', 52),
('Joseph Cruz', 'Manager', '938749', 'ylynch@example.org', 9),
('Michael Edwards', 'Staff', '160766', 'gordonmatthew@example.org', 29),
('Gregory Galvan', 'Staff', '609479', 'richard49@example.org', 31),
('Christine Young', 'Manager', '301210', 'garciamitchell@example.com', 19),
('Joseph Joseph', 'Staff', '794779', 'brentmccormick@example.com', 21),
('Amanda Davis', 'Staff', '270886', 'stephanie81@example.com', 74),
('Daniel Craig', 'Manager', '587403', 'samuelromero@example.net', 88),
('Daniel Levine', 'Manager', '811876', 'paulapope@example.org', 84),
('Michael Thornton', 'Manager', '137546', 'michael32@example.com', 48),
('Sharon Graham', 'Manager', '262176', 'estanley@example.com', 6),
('Cynthia Martinez', 'Manager', '141783', 'margaretramsey@example.net', 80),
('Kelly Conley', 'Manager', '771220', 'jodymccarthy@example.org', 69),
('Amanda Oneill', 'Staff', '690600', 'edwardhansen@example.com', 42),
('Eric Campos', 'Staff', '795452', 'gthompson@example.net', 97),
('Jill Wright', 'Manager', '782923', 'zwilson@example.org', 46),
('Daniel May', 'Staff', '551078', 'cristinaphillips@example.org', 29),
('Johnny Stafford', 'Staff', '877925', 'bryanpage@example.com', 84),
('Dawn Miller', 'Manager', '338176', 'lewistiffany@example.com', 39),
('Sara Keller', 'Manager', '589338', 'john21@example.com', 89),
('Tyler Rodriguez', 'Manager', '167616', 'lynn14@example.com', 95),
('Lisa Harris', 'Manager', '757663', 'michael73@example.net', 10),
('Sarah Hayes', 'Staff', '423541', 'jason65@example.org', 51),
('Tammy Allen', 'Staff', '693778', 'uroberts@example.com', 13),
('Melissa Paul', 'Manager', '653562', 'calderonkerry@example.org', 75),
('Jeffery Carter', 'Staff', '769646', 'gabriel23@example.org', 55),
('Jessica Warren', 'Manager', '690396', 'johnmurphy@example.org', 87),
('Nicole Joyce', 'Manager', '818488', 'verickson@example.org', 28),
('Kimberly Castaneda', 'Manager', '957653', 'derrick76@example.org', 29),
('Sherry Burton', 'Manager', '365895', 'barkercourtney@example.net', 9),
('Daniel Flores', 'Manager', '825631', 'jonessara@example.org', 54),
('Mary Torres', 'Staff', '525220', 'markbarnes@example.net', 88),
('Nicole Castro', 'Staff', '791565', 'mary46@example.org', 34),
('Renee Golden', 'Staff', '120673', 'carlos58@example.org', 53),
('Cassandra Flores', 'Staff', '230407', 'rogersthomas@example.net', 3),
('Harold Williams', 'Staff', '570300', 'johnanderson@example.com', 71),
('Melissa Hall', 'Manager', '800802', 'hernandezdavid@example.net', 70),
('Susan Clark', 'Manager', '777567', 'david32@example.org', 81),
('John Carter', 'Manager', '977975', 'ystone@example.com', 76),
('Karen Brown', 'Staff', '753800', 'mark01@example.org', 15),
('Paul Garcia', 'Staff', '644793', 'uhernandez@example.org', 64),
('Taylor Vasquez', 'Manager', '359141', 'terryjoseph@example.org', 69),
('Christopher Patel', 'Manager', '951467', 'loritaylor@example.net', 78),
('Mark Glover', 'Staff', '725035', 'murphyjaclyn@example.net', 75),
('Julie Dean', 'Manager', '339837', 'seantucker@example.net', 88),
('Brad Moreno', 'Manager', '883106', 'robert81@example.org', 84),
('Ruth Kim', 'Staff', '852619', 'richardmelendez@example.org', 83),
('Christopher Vincent', 'Manager', '235935', 'nicole63@example.org', 90),
('Carol Crawford', 'Staff', '696677', 'sarahwilliams@example.com', 26),
('Erica Santana', 'Staff', '866276', 'edwardsjoseph@example.net', 91),
('Penny Pacheco', 'Staff', '167647', 'harrismicheal@example.com', 8),
('William Vargas', 'Manager', '953459', 'amberwallace@example.org', 91),
('Monica Avila', 'Staff', '703329', 'erika56@example.net', 3),
('Linda Johns', 'Staff', '923919', 'sarahgutierrez@example.net', 22),
('Christopher Ruiz', 'Manager', '554115', 'dennisjohn@example.com', 93),
('Richard Wilson', 'Manager', '266011', 'carloswhite@example.org', 41),
('Brandon Blevins', 'Staff', '697217', 'dawnsullivan@example.com', 85),
('Michelle Johnson', 'Staff', '741138', 'silvashane@example.org', 8),
('Joel Frank', 'Staff', '712507', 'ramirezmark@example.net', 52),
('Randy Abbott', 'Staff', '248517', 'ffox@example.org', 21),
('Amanda Valdez', 'Manager', '618351', 'brandon42@example.com', 23),
('Tony Gilbert', 'Manager', '202052', 'cervantesjessica@example.org', 56),
('John Davila', 'Manager', '117090', 'ryanobrien@example.net', 24),
('Alexis Garcia', 'Staff', '660988', 'yvonne23@example.net', 89),
('Glenn Gonzalez', 'Staff', '964345', 'colleen02@example.org', 10),
('Jessica Rivera', 'Manager', '102972', 'cassandrameza@example.net', 77),
('Andrew Vega', 'Manager', '744398', 'vrichardson@example.org', 16),
('Randy Cox', 'Staff', '581458', 'gonzalezdanielle@example.org', 65),
('Valerie Tran', 'Staff', '331170', 'andreabrown@example.org', 35),
('William Nelson', 'Manager', '868956', 'gbarton@example.org', 92),
('Monique Castillo', 'Staff', '304857', 'brandon61@example.org', 6),
('Christopher Michael', 'Manager', '414326', 'joshua82@example.org', 42),
('Michael Miller', 'Staff', '709030', 'friley@example.com', 84),
('Brian Maxwell', 'Manager', '250478', 'philip85@example.com', 63),
('Rhonda Simpson', 'Manager', '462363', 'pmiller@example.com', 27),
('Lee Kim', 'Manager', '809669', 'millermeghan@example.net', 31),
('Justin Gillespie', 'Manager', '735178', 'aprilromero@example.org', 41),
('Emily Coleman', 'Manager', '836244', 'anthony62@example.org', 75),
('Amber Walton', 'Staff', '678852', 'spencerwright@example.org', 53),
('Elizabeth Mills', 'Staff', '239792', 'daniel94@example.com', 5),
('Thomas Keith', 'Staff', '840146', 'stephanie85@example.net', 20),
('Christopher Scott', 'Manager', '554812', 'joanthomas@example.org', 20),
('Calvin Thomas', 'Staff', '939348', 'elliottbrittany@example.org', 27),
('Jillian Allen', 'Manager', '786190', 'kimjames@example.org', 62),
('Jennifer Allen', 'Manager', '785948', 'paulhendricks@example.net', 44),
('Holly Braun', 'Manager', '477667', 'whitemicheal@example.net', 93),
('Isaac Smith', 'Staff', '411777', 'benjamin73@example.com', 21),
('Charles Rogers', 'Staff', '420519', 'allison55@example.org', 84),
('Ryan Ryan', 'Staff', '848298', 'matthewcline@example.org', 46),
('Denise White', 'Staff', '836892', 'samanthaharrison@example.org', 32),
('Anthony Ramirez', 'Staff', '853721', 'warrentina@example.org', 30),
('Joseph Mercer', 'Manager', '164329', 'paul55@example.com', 86),
('James Reese', 'Manager', '181876', 'rowealexis@example.com', 88),
('Michael Chapman', 'Staff', '454608', 'kellymendoza@example.org', 55);
INSERT INTO Customer (CustomerName, Phone, Email, Address) VALUES
('Anna Morris', '405577', 'ellen59@example.com', '4447 Alexis Estates Apt. 824
East Russell, TN 16429'),
('Tammie Hill', '529881', 'smithjennifer@example.org', '7601 Jill Glens
East Williamfort, NH 69744'),
('Karen Obrien', '741391', 'zgarcia@example.net', '97088 Hansen Fields
Michaelmouth, MI 09888'),
('Sandra Colon', '627171', 'michaelcruz@example.net', '312 Sellers Walks
West Jordan, MT 08955'),
('Steven Scott', '415480', 'joannaevans@example.com', '76657 Christopher Mountain
West Nicholasstad, AL 90952'),
('Shannon Brown', '561842', 'nhawkins@example.org', 'USS Ray
FPO AA 17128'),
('Jennifer Valentine', '448347', 'iwiggins@example.org', '28801 Brian Forge
Angelastad, DE 91239'),
('Laura Mills', '948947', 'kevin30@example.com', '6668 Taylor Mission Suite 174
New Amandaview, ID 39035'),
('Anita Zamora', '677822', 'jbates@example.net', 'PSC 7064, Box 2958
APO AA 66207'),
('Kayla Smith', '480702', 'bdowns@example.com', '9685 Price Cliff Suite 281
Ramseyton, ND 72683'),
('Mason Malone', '319597', 'wilsonderek@example.org', '366 Billy Extensions
Darylside, GA 86225'),
('Jennifer Brown', '271040', 'fredjones@example.com', '84867 Smith Divide Apt. 995
Christophertown, UT 85398'),
('Donna Farmer', '881478', 'manningdeborah@example.net', '0664 Shields Vista
Palmerhaven, AL 21813'),
('Anthony Pollard', '943372', 'robert20@example.com', '50195 Tiffany Manors Apt. 929
New Derekmouth, ME 56670'),
('Jeremy Trujillo', '545388', 'phoffman@example.org', '7193 Gay Ranch Suite 498
East Alexisview, ND 73507'),
('Jessica Rhodes', '283951', 'bowmankenneth@example.com', 'USS Rivas
FPO AA 12521'),
('Carla Anderson', '199161', 'tedwards@example.com', 'USNV Brown
FPO AP 42449'),
('Samantha Lowe', '142166', 'tracymoore@example.net', '4084 Jeanette Islands Apt. 986
Pachecoport, HI 15768'),
('Patrick Frank', '750626', 'amy35@example.org', '76418 Ortiz Mission
Tinamouth, MA 89046'),
('Daniel Smith', '234694', 'ebaker@example.net', '18312 Campbell Plains Suite 450
Lake Andreaburgh, MA 10500'),
('Melissa Hill', '609935', 'leesarah@example.com', '0861 Jose Parkway
Port Haleytown, GA 22562'),
('Kendra Valenzuela', '872259', 'careygina@example.com', '25968 Smith Valley Apt. 796
Lake Laurenborough, CT 60231'),
('Kimberly Cox', '981158', 'barnesamanda@example.net', '969 Mario Divide
Lake Alicia, PR 42434'),
('Jennifer Flores', '203598', 'znorman@example.com', '39256 Connor Place
Arielhaven, ND 07042'),
('Charles Anderson', '667812', 'martinjasmine@example.net', '1956 Smith Run Apt. 234
Maloneside, NE 98556'),
('Richard Hernandez', '701275', 'carlos01@example.net', '8851 Reginald Camp
Shahburgh, GU 55106'),
('Dr. Cassandra Davis', '187405', 'gstone@example.net', '557 Moore Crossroad Apt. 341
North Francisfurt, FM 68558'),
('Kristine Farmer', '491032', 'martin26@example.com', '4252 Potter Ranch
Patriciaville, NH 63293'),
('Alexis Webb', '359106', 'sreilly@example.org', '154 Moore Run Suite 765
North Michealburgh, OH 84716'),
('Stephen Fox', '356911', 'turnerashley@example.org', '03888 Peterson Streets
Millerport, VI 36407'),
('Jason Perez', '732073', 'curtis74@example.org', '22803 Larsen Knoll Apt. 853
Shannontown, NV 07245'),
('Sherri Carey', '842918', 'debbie51@example.org', 'PSC 6755, Box 9002
APO AE 67846'),
('Lauren Nelson', '836738', 'kevin82@example.org', '2309 Calvin Tunnel Suite 186
Petersfurt, CA 31572'),
('Jacob Schmidt', '881443', 'steven55@example.com', '0243 Blake Ridge Suite 801
Campbellport, AS 34633'),
('Ruth Becker', '872063', 'icox@example.org', 'USNV Hopkins
FPO AE 87956'),
('Benjamin Brown', '689457', 'joseanderson@example.com', '89749 Robert Trafficway Apt. 692
Bakerberg, NJ 84044'),
('John Bailey', '257728', 'smithjohn@example.com', 'Unit 2273 Box 4543
DPO AE 28622'),
('Charles Brown', '893669', 'schwartzerica@example.com', '181 Daniel Crest Suite 305
Johnstonside, AR 68084'),
('Michael Ruiz', '398018', 'lmiller@example.com', '14006 Jesse Ville
East Sean, NM 29077'),
('Christopher Chavez', '525130', 'gwalsh@example.net', 'PSC 2756, Box 0654
APO AP 78991'),
('Karen Vaughan', '435641', 'rodriguezbeverly@example.net', '8152 Johnson Station Suite 687
East Crystal, ME 78890'),
('Mary Rush', '431294', 'blackphillip@example.net', '63913 Dana Curve Suite 892
New Diana, FM 35118'),
('Matthew Gentry', '438704', 'gguerrero@example.com', 'Unit 2128 Box 2118
DPO AE 90930'),
('Colleen Henry', '277096', 'jeffreyortiz@example.org', 'USCGC Smith
FPO AE 50277'),
('Paul Davis', '896497', 'stephaniestrong@example.com', '196 Reed Fort
North Zoe, ID 30502'),
('Carla Bruce', '349228', 'oleon@example.org', '099 Beard River
Port Vanessa, CA 63720'),
('Erika Hernandez', '674139', 'michelle50@example.org', '4232 Nicholas Squares Suite 780
Lake Dawn, TX 07219'),
('Andrew Petty', '424989', 'sbennett@example.com', '236 Kimberly Camp Suite 803
Port Jessica, VI 84284'),
('Melissa Johnson', '230651', 'hensonelizabeth@example.org', '6754 Evelyn Forest
Port Valerieton, AR 79425'),
('Mitchell Williams', '750963', 'lfitzpatrick@example.com', 'PSC 4251, Box 6152
APO AP 51314'),
('Dana Barrett', '607507', 'nancylittle@example.net', '71218 Gina Fork Apt. 607
Port Judy, NM 58267'),
('Matthew Gallegos', '667374', 'perkinsamber@example.com', '66895 Joseph Loop Suite 729
Port Jennifermouth, OR 82709'),
('Jason Chambers', '118625', 'tsoto@example.org', '6279 Jones Estates
East Keith, TN 96820'),
('Jessica Brown DVM', '671238', 'sylviacisneros@example.com', '70559 Juan Causeway Apt. 347
Gloriaburgh, NC 43483'),
('Daniel Thomas', '384058', 'kwelch@example.org', '34852 Sutton Fort
Port Stevenchester, WI 33178'),
('Elizabeth Mayer', '150168', 'annesmith@example.com', 'PSC 3025, Box 1490
APO AA 45485'),
('Robert Bush', '256947', 'ksmith@example.net', '3408 Contreras Curve
Josephborough, GA 41666'),
('Denise Copeland', '933152', 'cochoa@example.com', '02197 Rodriguez Plains
Rossside, DC 04448'),
('Stephanie Chang', '690967', 'susanschneider@example.com', '2657 Christine Meadows Suite 090
North Toddside, HI 85426'),
('Amy Stephens', '470285', 'arthur60@example.com', 'PSC 1628, Box 9470
APO AP 62591'),
('Brandi Gilbert', '607609', 'anna12@example.net', 'PSC 8198, Box 6766
APO AP 15386'),
('Danielle Jackson', '174281', 'powelljill@example.com', '8056 Hogan Loaf
New Michaela, ND 21010'),
('Timothy Walter', '850680', 'kbrown@example.net', 'PSC 9145, Box 7152
APO AP 21348'),
('Linda Sanchez', '568792', 'mary35@example.net', '9236 Alexandria Plains Apt. 212
New Carl, DC 90352'),
('Justin Sanford', '861313', 'carol41@example.net', '34784 John Circle
Adrianbury, SD 13766'),
('Michelle Deleon', '102522', 'rfox@example.com', '654 Brenda Corner Suite 923
Jessicashire, KS 59073'),
('Kenneth Burgess', '576188', 'dawn74@example.org', '33660 Julie Shoal
Larsonmouth, ND 00714'),
('James Brooks', '905237', 'bruce01@example.net', '1497 Navarro Place
West Eugene, GA 62493'),
('Teresa Valencia', '385578', 'hgutierrez@example.net', 'Unit 6596 Box 6788
DPO AP 54560'),
('Nicole Kramer', '907699', 'alexander34@example.com', 'USS Molina
FPO AE 28608'),
('Hailey Valencia', '144832', 'qthompson@example.org', '218 Phillips Hills Apt. 979
East Catherineton, AZ 31252'),
('Travis Harris', '120602', 'christine99@example.net', '7933 Oscar Squares
South Rickymouth, PA 15704'),
('Kim Ortega', '653196', 'smithjacob@example.org', '506 Everett Haven Apt. 460
South Codyland, ND 31191'),
('Kari Smith', '735690', 'williamsjulie@example.org', '8486 Mitchell Isle Suite 707
Lake Joantown, TX 95370'),
('John Martinez', '318915', 'laura70@example.net', '9047 Gordon Camp Suite 361
Ericport, KY 85786'),
('Jimmy Acevedo', '838942', 'ylara@example.org', '9864 Keith Drives
Beanside, NY 97120'),
('Ruth Harris', '817652', 'justin71@example.org', '134 Kristen Bypass
Campbellland, NH 31362'),
('Jose Cole', '858022', 'parkchristy@example.net', '77959 Gilbert Forges
Garciamouth, MT 19064'),
('Nathan Henderson', '294056', 'thomasgreen@example.net', 'USNS Reyes
FPO AA 39110'),
('Sarah Ponce', '681031', 'youngsandra@example.net', '16494 Rivera Mills
Loriburgh, OK 86553'),
('Paula Foster', '231647', 'wjenkins@example.org', '1278 Adkins Haven Apt. 863
Steventon, FL 32491'),
('Jennifer Zamora', '701656', 'sylvia19@example.com', '6640 Ronnie Street Suite 014
Marcusport, LA 35966'),
('Brianna Lam', '105722', 'bowersteresa@example.org', '33045 Mathew Ramp Suite 099
New Carlos, KS 33205'),
('Fred Ramirez', '376907', 'frivera@example.com', '0011 Carolyn Knolls Apt. 572
Shermantown, NV 47050'),
('Nicholas Pierce', '563979', 'garciaalyssa@example.com', '9395 Zimmerman Track Apt. 576
Ashleyview, OR 68262'),
('Shannon Martin', '248061', 'roberta53@example.com', '658 Pratt Landing Suite 423
North Tylerbury, WA 15719'),
('Tammy Kelly', '681592', 'toni62@example.net', '92486 Cervantes Trail
Michaelfort, FM 05867'),
('Nicholas Berger', '907287', 'jose50@example.net', '43316 Mcconnell Village
Sharonton, WY 04467'),
('Omar Parks', '387850', 'saundersbethany@example.net', '4310 Rachel Circles Suite 039
North Jonathan, GU 24329'),
('Ryan Shaw', '319965', 'steven77@example.com', '93597 Tyrone Shores
West Ralphton, OR 41836'),
('Lisa Horn', '132919', 'adrianfitzgerald@example.com', '65927 Grant Mountains
Leebury, NH 23232'),
('Jonathan Watson', '142354', 'meganwright@example.net', '057 Miller Lights
South Jesse, LA 78295'),
('Anthony Hall', '350098', 'robinsonjoan@example.com', '5839 Harris Junctions
Wellsmouth, OR 83065'),
('Kimberly Murphy', '770475', 'justin58@example.org', '1662 Melissa Street
Annmouth, ND 27971'),
('Kathryn Sanchez', '361233', 'ochoanatasha@example.com', '2678 Keith Rue Suite 495
Ashleyton, NC 10272'),
('Amber Brown', '298823', 'marvin89@example.com', 'PSC 1784, Box 0393
APO AA 27404'),
('Gregory Pope', '240923', 'julie12@example.com', '2366 Lisa Bypass Apt. 014
New Corymouth, AL 49034'),
('Charlotte Rivera', '197652', 'vharris@example.com', '340 Mann Valley
New Madison, OH 82398'),
('Andrew Barker', '360141', 'hammondcaitlin@example.com', '036 Browning Manor
Wallaceberg, MH 05890'),
('Kevin Stafford', '418591', 'smithkevin@example.net', '35424 Hicks Center
West Carolbury, RI 99364');


INSERT INTO SalesOrder (CustomerID, OrderDate, TotalAmount, StatusID) VALUES
(1, '2024-01-01', 250.50, 1),
(2, '2024-01-02', 125.75, 2),
(3, '2024-01-03', 300.00, 3),
(4, '2024-01-04', 99.99, 1),
(5, '2024-01-05', 500.25, 2),
(6, '2024-01-06', 175.80, 3),
(7, '2024-01-07', 220.40, 1),
(8, '2024-01-08', 410.75, 2),
(9, '2024-01-09', 145.60, 3),
(10, '2024-01-10', 333.33, 1),
(11, '2024-01-11', 210.20, 2),
(12, '2024-01-12', 299.99, 3),
(13, '2024-01-13', 89.95, 1),
(14, '2024-01-14', 120.00, 2),
(15, '2024-01-15', 480.50, 3),
(16, '2024-01-16', 275.25, 1),
(17, '2024-01-17', 360.00, 2),
(18, '2024-01-18', 410.00, 3),
(19, '2024-01-19', 95.50, 1),
(20, '2024-01-20', 600.75, 2),
(21, '2024-01-21', 320.40, 3),
(22, '2024-01-22', 150.90, 1),
(23, '2024-01-23', 430.25, 2),
(24, '2024-01-24', 210.30, 3),
(25, '2024-01-25', 330.10, 1),
(26, '2024-01-26', 120.75, 2),
(27, '2024-01-27', 415.00, 3),
(28, '2024-01-28', 500.90, 1),
(29, '2024-01-29', 290.00, 2),
(30, '2024-01-30', 175.50, 3),
(31, '2024-02-01', 240.40, 1),
(32, '2024-02-02', 310.75, 2),
(33, '2024-02-03', 130.60, 3),
(34, '2024-02-04', 500.25, 1),
(35, '2024-02-05', 220.00, 2),
(36, '2024-02-06', 410.80, 3),
(37, '2024-02-07', 99.99, 1),
(38, '2024-02-08', 210.25, 2),
(39, '2024-02-09', 299.50, 3),
(40, '2024-02-10', 470.20, 1),
(41, '2024-02-11', 180.10, 2),
(42, '2024-02-12', 395.90, 3),
(43, '2024-02-13', 240.75, 1),
(44, '2024-02-14', 450.25, 2),
(45, '2024-02-15', 150.00, 3),
(46, '2024-02-16', 510.40, 1),
(47, '2024-02-17', 260.25, 2),
(48, '2024-02-18', 320.00, 3),
(49, '2024-02-19', 95.00, 1),
(50, '2024-02-20', 480.75, 2),
(51, '2024-02-21', 340.90, 3),
(52, '2024-02-22', 190.30, 1),
(53, '2024-02-23', 415.50, 2),
(54, '2024-02-24', 225.00, 3),
(55, '2024-02-25', 480.40, 1),
(56, '2024-02-26', 275.25, 2),
(57, '2024-02-27', 310.80, 3),
(58, '2024-02-28', 99.99, 1),
(59, '2024-02-29', 220.25, 2),
(60, '2024-03-01', 299.90, 3),
(61, '2024-03-02', 470.20, 1),
(62, '2024-03-03', 185.10, 2),
(63, '2024-03-04', 390.90, 3),
(64, '2024-03-05', 240.75, 1),
(65, '2024-03-06', 450.25, 2),
(66, '2024-03-07', 155.00, 3),
(67, '2024-03-08', 510.40, 1),
(68, '2024-03-09', 265.25, 2),
(69, '2024-03-10', 330.00, 3),
(70, '2024-03-11', 105.00, 1),
(71, '2024-03-12', 500.75, 2),
(72, '2024-03-13', 340.90, 3),
(73, '2024-03-14', 190.30, 1),
(74, '2024-03-15', 425.50, 2),
(75, '2024-03-16', 225.00, 3),
(76, '2024-03-17', 490.40, 1),
(77, '2024-03-18', 275.25, 2),
(78, '2024-03-19', 310.80, 3),
(79, '2024-03-20', 109.99, 1),
(80, '2024-03-21', 230.25, 2),
(81, '2024-03-22', 309.90, 3),
(82, '2024-03-23', 480.20, 1),
(83, '2024-03-24', 195.10, 2),
(84, '2024-03-25', 400.90, 3),
(85, '2024-03-26', 250.75, 1),
(86, '2024-03-27', 460.25, 2),
(87, '2024-03-28', 165.00, 3),
(88, '2024-03-29', 520.00, 1),
(89, '2024-03-30', 280.50, 2),
(90, '2024-03-31', 350.75, 3),
(91, '2024-04-01', 120.00, 1),
(92, '2024-04-02', 430.25, 2),
(93, '2024-04-03', 270.50, 3),
(94, '2024-04-04', 310.75, 1),
(95, '2024-04-05', 500.00, 2),
(96, '2024-04-06', 360.90, 3),
(97, '2024-04-07', 150.50, 1),
(98, '2024-04-08', 475.25, 2),
(99, '2024-04-09', 290.00, 3),
(100, '2024-04-10', 530.75, 1); 
INSERT INTO PurchaseOrder (SupplierID, OrderDate, TotalAmount, StatusID) VALUES
(25, '2024-09-28', 4313.96, 2),
(90, '2025-02-15', 4836.16, 4),
(31, '2024-05-23', 3177.16, 1),
(71, '2024-06-24', 725.04, 2),
(62, '2025-01-21', 701.27, 4),
(53, '2024-04-23', 1995.87, 2),
(50, '2024-07-10', 1943.5, 4),
(57, '2024-09-27', 942.73, 2),
(8, '2024-08-21', 816.41, 3),
(60, '2024-03-28', 3163.59, 5),
(70, '2024-05-26', 3353.16, 4),
(95, '2025-01-08', 2827.99, 5),
(10, '2024-09-30', 4921.87, 2),
(63, '2024-04-11', 1834.94, 4),
(92, '2024-03-18', 4660.97, 5),
(1, '2024-08-24', 956.59, 1),
(80, '2024-06-04', 1466.69, 2),
(62, '2024-04-06', 4415.68, 3),
(56, '2024-05-12', 2634.8, 3),
(36, '2024-08-20', 3352.33, 5),
(16, '2025-01-27', 2905.47, 1),
(82, '2024-06-13', 2246.08, 5),
(3, '2024-12-10', 1672.06, 5),
(58, '2024-08-12', 1387.02, 2),
(95, '2024-08-03', 1290.73, 5),
(8, '2024-09-10', 4674.25, 3),
(65, '2024-08-03', 1601.54, 4),
(1, '2024-06-25', 2240.21, 4),
(1, '2024-06-02', 2327.19, 5),
(12, '2024-11-12', 1714.95, 3),
(65, '2024-05-16', 4814.02, 2),
(85, '2024-09-05', 3063.81, 3),
(72, '2024-04-29', 1661.37, 4),
(11, '2024-05-30', 777.8, 1),
(60, '2024-05-16', 550.03, 1),
(77, '2024-08-29', 3133.64, 3),
(17, '2024-05-24', 4999.24, 3),
(70, '2025-01-01', 3340.38, 1),
(79, '2024-10-22', 4875.0, 3),
(38, '2024-11-02', 1893.04, 3),
(16, '2024-04-19', 478.34, 4),
(95, '2024-12-15', 1125.24, 1),
(96, '2024-10-18', 2352.21, 3),
(49, '2024-03-22', 51.87, 3),
(54, '2024-05-12', 1708.44, 2),
(38, '2024-09-25', 1390.95, 3),
(76, '2025-01-13', 4337.63, 3),
(18, '2024-12-15', 4786.15, 1),
(62, '2024-03-08', 4887.89, 5),
(2, '2024-07-27', 3563.23, 3),
(42, '2024-10-26', 2802.34, 4),
(27, '2024-04-25', 3726.72, 2),
(6, '2024-10-20', 4095.44, 5),
(35, '2024-03-10', 1387.05, 3),
(96, '2025-02-20', 3465.45, 3),
(55, '2025-01-18', 1195.07, 3),
(20, '2024-12-03', 2766.97, 2),
(34, '2024-06-29', 468.26, 5),
(89, '2025-01-03', 320.77, 5),
(14, '2024-07-23', 2693.05, 3),
(74, '2025-02-11', 1518.61, 4),
(74, '2024-04-27', 3705.74, 3),
(90, '2025-02-17', 171.94, 3),
(91, '2024-04-26', 169.98, 1),
(70, '2024-08-21', 1363.45, 2),
(60, '2024-06-15', 3704.24, 3),
(25, '2025-02-18', 2913.57, 5),
(53, '2024-07-04', 812.62, 5),
(98, '2024-09-20', 3746.45, 1),
(9, '2025-01-20', 928.46, 3),
(44, '2024-04-21', 169.75, 2),
(35, '2024-10-25', 488.12, 5),
(93, '2024-07-19', 914.1, 1),
(59, '2024-10-28', 1217.61, 5),
(18, '2024-10-18', 4987.09, 5),
(78, '2024-03-09', 4267.29, 5),
(19, '2024-10-30', 3237.49, 5),
(91, '2024-11-05', 3282.52, 2),
(11, '2024-12-16', 1100.43, 4),
(99, '2024-05-29', 413.36, 5),
(7, '2024-06-24', 1617.57, 3),
(48, '2024-09-02', 4809.07, 4),
(2, '2024-07-01', 4258.28, 2),
(46, '2024-06-08', 3554.99, 1),
(76, '2024-03-03', 3564.09, 2),
(1, '2024-11-30', 3429.56, 4),
(1, '2024-06-06', 1379.79, 2),
(78, '2024-12-17', 1023.57, 2),
(74, '2024-04-15', 566.84, 5),
(56, '2024-12-26', 2876.46, 3),
(39, '2024-12-30', 1859.87, 1),
(71, '2024-05-01', 3551.59, 2),
(48, '2024-08-26', 1596.03, 2),
(41, '2024-04-27', 2739.78, 1),
(52, '2024-05-26', 254.57, 4),
(19, '2024-06-03', 212.61, 3),
(25, '2024-10-10', 4889.11, 5),
(59, '2024-08-12', 4412.72, 4),
(36, '2024-08-19', 1256.5, 5),
(54, '2025-02-09', 1877.75, 2);

INSERT INTO Shipment (PurchaseOrderID, ShipmentDate, CarrierName, TrackingNumber, StatusID) VALUES
(91, '2024-12-19', 'FedEx', '146C0D0F-252', 5),
(6, '2024-08-30', 'USPS', '3579E3AD-D61', 3),
(81, '2024-12-13', 'UPS', '9B8F0EF1-5B3', 5),
(25, '2025-02-10', 'FedEx', '587D2E68-98E', 2),
(20, '2024-06-25', 'DHL', 'E0112701-186', 1),
(14, '2025-02-21', 'UPS', '1A5DC9F0-8CB', 2),
(40, '2024-10-02', 'FedEx', 'DD9760F9-FC2', 3),
(38, '2024-04-06', 'UPS', '01887B4C-D5C', 1),
(3, '2024-05-23', 'TNT', 'FBCC9392-F68', 5),
(20, '2024-10-06', 'TNT', '2F5E339B-FBB', 3),
(57, '2024-08-20', 'TNT', '1C2353B2-285', 5),
(88, '2024-05-16', 'USPS', 'E909497A-46C', 4),
(77, '2024-09-28', 'TNT', 'A2AF3FCB-2B9', 3),
(11, '2024-11-23', 'USPS', 'D477BCE0-93F', 4),
(18, '2024-09-27', 'FedEx', '06855D5F-EE8', 2),
(38, '2024-06-10', 'FedEx', '91A4D968-0A7', 4),
(60, '2025-02-17', 'USPS', '0E69CD91-AFC', 3),
(39, '2024-07-30', 'FedEx', '40328CF5-DB9', 3),
(40, '2024-10-14', 'FedEx', '9484313D-F42', 4),
(95, '2024-08-09', 'TNT', '4D3C88B3-0CC', 3),
(28, '2024-07-24', 'TNT', 'FE3E6251-671', 1),
(74, '2025-01-11', 'TNT', '072B6283-71F', 5),
(90, '2024-04-08', 'TNT', 'A2192808-759', 4),
(87, '2024-05-08', 'DHL', '74A72DCF-024', 5),
(10, '2024-05-22', 'DHL', '6A393DB4-9F3', 1),
(31, '2024-09-15', 'USPS', 'B2C9C493-FDD', 5),
(85, '2024-08-07', 'UPS', '3B709654-ECE', 1),
(69, '2024-12-28', 'USPS', '4ADB55C4-A03', 4),
(6, '2024-09-26', 'DHL', '5D19300C-84A', 3),
(52, '2024-09-27', 'FedEx', '94B022D5-B8D', 4),
(23, '2024-08-06', 'USPS', '5F7DCBEE-B81', 3),
(21, '2025-01-21', 'FedEx', '4FD817C9-14B', 2),
(26, '2024-08-04', 'FedEx', '76CDE48B-55A', 3),
(50, '2024-11-11', 'TNT', 'E0766934-477', 3),
(30, '2024-09-19', 'DHL', '684C9768-1ED', 4),
(1, '2024-11-23', 'FedEx', 'BBB7A0B7-F19', 3),
(68, '2024-06-08', 'TNT', '0FAB0504-4CD', 3),
(24, '2024-07-01', 'UPS', '2F3B023B-840', 5),
(97, '2024-11-20', 'FedEx', '51DC9C89-30A', 1),
(39, '2024-07-18', 'TNT', '57ED3031-4A3', 4),
(40, '2024-06-11', 'DHL', '2F479F06-569', 1),
(58, '2024-12-31', 'TNT', '833332CF-04B', 1),
(24, '2024-11-06', 'FedEx', 'A49CBE41-5BF', 4),
(62, '2024-07-05', 'USPS', 'EE41D444-13E', 1),
(86, '2024-12-28', 'TNT', 'AE94C7FD-BC2', 3),
(77, '2025-01-05', 'FedEx', '97EB2257-1F5', 5),
(26, '2024-06-03', 'TNT', 'FA00623C-9DD', 1),
(95, '2024-12-03', 'DHL', 'A382944E-094', 5),
(65, '2024-03-06', 'TNT', '3D2834FA-7CA', 5),
(90, '2025-01-10', 'UPS', '3B987BB4-C2B', 4),
(62, '2024-09-09', 'FedEx', 'F5A6631E-E04', 3),
(84, '2025-02-08', 'FedEx', 'F192DC22-519', 2),
(47, '2025-02-17', 'UPS', 'F3C1F644-4A8', 5),
(53, '2024-09-19', 'DHL', '7986224B-126', 3),
(100, '2024-08-11', 'UPS', 'F8233C82-0FB', 1),
(42, '2024-11-19', 'FedEx', 'F2F2E2F1-2C1', 5),
(23, '2024-08-10', 'DHL', '2E5326AE-DD0', 5),
(84, '2025-01-29', 'UPS', '6FFCCD35-3AE', 2),
(11, '2024-11-30', 'FedEx', '123D0F5C-B52', 4),
(5, '2024-06-27', 'DHL', '5F79E28B-030', 4),
(81, '2024-04-07', 'TNT', '7CE33DBF-2E9', 5),
(62, '2024-05-07', 'UPS', 'FABFFD81-718', 3),
(24, '2024-03-25', 'USPS', 'B433D609-06A', 5),
(76, '2025-02-07', 'DHL', '396DEC57-9F4', 2),
(41, '2024-03-03', 'DHL', '90551419-B65', 5),
(65, '2024-09-08', 'FedEx', 'C30ADAFF-AE4', 5),
(71, '2024-09-26', 'USPS', 'DAE4E196-F23', 2),
(94, '2025-02-16', 'UPS', 'F9EF2CF3-37E', 1),
(73, '2024-07-21', 'TNT', '1F479097-4EF', 1),
(56, '2025-02-28', 'UPS', '56FE1B84-A95', 5),
(44, '2025-01-29', 'TNT', '0A7EF9FF-238', 1),
(21, '2024-11-15', 'UPS', '05BC94E7-604', 4),
(83, '2024-11-03', 'USPS', '683DAE87-5B6', 3),
(35, '2025-02-03', 'FedEx', '946748BD-030', 3),
(42, '2024-08-14', 'USPS', 'DD191C6D-CB0', 2),
(32, '2025-02-23', 'FedEx', 'B3E0D878-FB4', 5),
(3, '2025-02-16', 'USPS', '4690837D-697', 2),
(3, '2024-09-19', 'USPS', 'D3A0D168-F02', 3),
(20, '2024-10-21', 'DHL', '9F8BFCBA-14C', 3),
(74, '2024-05-08', 'FedEx', 'B4D705A6-6A5', 2),
(52, '2025-01-04', 'FedEx', 'CE3F5A7F-093', 2),
(39, '2024-07-29', 'FedEx', '14F65824-85F', 4),
(67, '2025-01-06', 'TNT', '76AD72CC-11F', 4),
(42, '2024-03-28', 'USPS', '02BFD5B4-9F3', 4),
(99, '2024-03-13', 'USPS', 'BE13CDBC-3CA', 1),
(14, '2024-12-23', 'DHL', '21E18C58-9E4', 2),
(83, '2025-01-30', 'DHL', '25251440-9A4', 3),
(88, '2024-06-06', 'USPS', '1386311D-A42', 3),
(97, '2025-01-09', 'UPS', 'BA4215BE-699', 4),
(83, '2024-10-02', 'DHL', 'F15D6A7C-E84', 3),
(37, '2024-10-04', 'DHL', '94F80F8C-9DF', 2),
(91, '2024-05-06', 'DHL', '0FD42C7F-E35', 5),
(56, '2024-05-28', 'UPS', '7B2D41CE-92F', 1),
(80, '2024-06-20', 'TNT', '9779F2AA-38A', 3),
(68, '2025-02-02', 'UPS', 'FC8BD870-85E', 5),
(40, '2024-05-17', 'USPS', '1FA0B25D-30D', 3),
(47, '2024-10-14', 'TNT', 'DA484BC3-57D', 3),
(75, '2024-06-24', 'TNT', '3206FB20-969', 5),
(15, '2024-11-03', 'TNT', 'DE83E74F-7C3', 2),
(94, '2024-08-02', 'USPS', '3F58D0A1-DA5', 1);

INSERT INTO OrderTracking (SalesOrderID, ShipmentID, StatusID, EstimatedDeliveryDate, ActualDeliveryDate) VALUES
(40537, 19865, 2, '2025-03-06', '2025-03-05'),
(70373, 55708, 1, '2025-03-09', '2025-03-09'),
(53618, 8385, 3, '2025-03-08', '2025-03-09'),
(63908, 20016, 4, '2025-03-06', '2025-03-06'),
(77069, 77267, 4, '2025-03-15', '2025-03-15'),
(89903, 15315, 4, '2025-03-07', '2025-03-05'),
(19914, 55640, 5, '2025-03-05', '2025-03-07'),
(19321, 9331, 3, '2025-03-13', '2025-03-14'),
(99102, 23191, 5, '2025-03-17', '2025-03-19'),
(54925, 75522, 5, '2025-03-16', '2025-03-19'),
(63626, 94698, 3, '2025-03-08', '2025-03-08'),
(46455, 31273, 5, '2025-03-16', '2025-03-14'),
(10859, 42927, 1, '2025-03-06', '2025-03-05'),
(35733, 64124, 3, '2025-03-14', '2025-03-16'),
(85205, 92198, 4, '2025-03-12', '2025-03-11'),
(16734, 98353, 3, '2025-03-10', '2025-03-09'),
(15160, 12279, 4, '2025-03-09', '2025-03-09'),
(54478, 7504, 1, '2025-03-12', '2025-03-15'),
(24533, 94961, 3, '2025-03-06', '2025-03-04'),
(42932, 72167, 2, '2025-03-09', '2025-03-08'),
(22661, 26516, 3, '2025-03-11', '2025-03-12'),
(58932, 91183, 3, '2025-03-14', '2025-03-14'),
(71460, 44693, 1, '2025-03-09', '2025-03-11'),
(87084, 56926, 1, '2025-03-10', '2025-03-13'),
(18697, 20157, 1, '2025-03-13', '2025-03-11'),
(99357, 90224, 2, '2025-03-14', '2025-03-15'),
(46107, 40756, 1, '2025-03-16', '2025-03-16'),
(68343, 69652, 1, '2025-03-14', '2025-03-17'),
(53710, 64481, 3, '2025-03-12', '2025-03-14'),
(22886, 90004, 2, '2025-03-15', '2025-03-17'),
(99683, 36830, 1, '2025-03-10', '2025-03-11'),
(77059, 17392, 2, '2025-03-16', '2025-03-19'),
(26013, 16299, 1, '2025-03-10', '2025-03-08'),
(38209, 72585, 4, '2025-03-12', '2025-03-12'),
(29064, 35479, 2, '2025-03-12', '2025-03-10'),
(76661, 83516, 4, '2025-03-15', '2025-03-16'),
(52102, 74704, 1, '2025-03-17', '2025-03-20'),
(99741, 58255, 2, '2025-03-07', '2025-03-08'),
(40623, 86060, 3, '2025-03-13', '2025-03-16'),
(59546, 62256, 4, '2025-03-11', '2025-03-11'),
(63723, 15494, 4, '2025-03-14', '2025-03-14'),
(88990, 61028, 5, '2025-03-17', '2025-03-16'),
(60361, 93348, 4, '2025-03-10', '2025-03-12'),
(63510, 30211, 1, '2025-03-15', '2025-03-13'),
(71050, 53495, 3, '2025-03-11', '2025-03-14'),
(83259, 83555, 2, '2025-03-17', '2025-03-19'),
(22307, 35229, 5, '2025-03-09', '2025-03-12'),
(71888, 8700, 3, '2025-03-17', '2025-03-15'),
(21386, 99472, 1, '2025-03-12', '2025-03-11'),
(70965, 8248, 4, '2025-03-06', '2025-03-04'),
(51254, 72050, 3, '2025-03-13', '2025-03-13'),
(49518, 41675, 5, '2025-03-07', '2025-03-09'),
(35909, 74622, 1, '2025-03-07', '2025-03-09'),
(28130, 61865, 3, '2025-03-10', '2025-03-12'),
(22915, 78967, 3, '2025-03-14', '2025-03-15'),
(35120, 72806, 4, '2025-03-17', '2025-03-19'),
(85263, 80000, 3, '2025-03-12', '2025-03-14'),
(67518, 69023, 5, '2025-03-11', '2025-03-09'),
(25419, 37443, 1, '2025-03-14', '2025-03-12'),
(32003, 68176, 5, '2025-03-07', '2025-03-08'),
(78859, 53128, 2, '2025-03-10', '2025-03-10'),
(20453, 38125, 2, '2025-03-09', '2025-03-07'),
(14401, 85728, 5, '2025-03-09', '2025-03-11'),
(66850, 8227, 3, '2025-03-11', '2025-03-13'),
(77594, 30947, 1, '2025-03-16', '2025-03-14'),
(68377, 41755, 2, '2025-03-09', '2025-03-09'),
(62854, 58089, 4, '2025-03-17', '2025-03-16'),
(94441, 78829, 4, '2025-03-06', '2025-03-08'),
(52721, 95007, 4, '2025-03-16', '2025-03-16'),
(90250, 16938, 1, '2025-03-05', '2025-03-06'),
(92116, 64974, 2, '2025-03-09', '2025-03-12'),
(35445, 81659, 5, '2025-03-15', '2025-03-16'),
(99712, 88575, 1, '2025-03-11', '2025-03-10'),
(99991, 92032, 2, '2025-03-06', '2025-03-04'),
(17142, 91784, 5, '2025-03-12', '2025-03-10'),
(31366, 16167, 3, '2025-03-15', '2025-03-14'),
(31863, 54990, 2, '2025-03-12', '2025-03-10'),
(19031, 35023, 5, '2025-03-10', '2025-03-13'),
(55206, 26059, 2, '2025-03-09', '2025-03-07'),
(28966, 33354, 2, '2025-03-11', '2025-03-09'),
(34371, 9320, 3, '2025-03-07', '2025-03-09'),
(32386, 73096, 2, '2025-03-11', '2025-03-11'),
(46715, 51725, 2, '2025-03-12', '2025-03-13'),
(66530, 89159, 5, '2025-03-08', '2025-03-06'),
(59382, 79763, 4, '2025-03-08', '2025-03-10'),
(11015, 28105, 1, '2025-03-12', '2025-03-11'),
(81886, 22672, 1, '2025-03-15', '2025-03-16'),
(10973, 38490, 3, '2025-03-16', '2025-03-19'),
(92545, 82093, 3, '2025-03-15', '2025-03-14'),
(16317, 18732, 1, '2025-03-14', '2025-03-13'),
(76051, 78251, 1, '2025-03-13', '2025-03-16'),
(81790, 61401, 3, '2025-03-12', '2025-03-10'),
(82160, 46841, 4, '2025-03-16', '2025-03-15'),
(46117, 22683, 2, '2025-03-09', '2025-03-09'),
(86900, 90473, 2, '2025-03-16', '2025-03-15'),
(30276, 67125, 5, '2025-03-17', '2025-03-20'),
(22999, 10948, 4, '2025-03-07', '2025-03-09'),
(31390, 82667, 3, '2025-03-10', '2025-03-10'),
(12602, 13490, 3, '2025-03-16', '2025-03-19'),
(16847, 8617, 5, '2025-03-08', '2025-03-08');
CREATE INDEX idx_product_name ON Product(ProductName);

ALTER TABLE Supplier ADD CONSTRAINT unique_supplier_phone UNIQUE (Phone);
