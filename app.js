const express = require('express')
const bodyParser = require('body-parser')
const db = require('./queries')
const app = express()
const port = 3000

/////////////////////// Minimum Functionality /////////////
// X 1) Create new Users
// X 2) Read User Data
// X 3) Update User Data
// X 4) Delete User
// X 5) List all Users
//////////////////////// Stretch Goal 1 ////////////////////
// X 1) Add Data -- User data added via postman
// 2) Add item entries 
// 3) Add purchaseOrder entries
// 4) add salesOrder entries
// 5) add Customers entries
// 6) add Manufactures entries
//////////////////////// Stretch Goal 2 ////////////////////
// 1) Error checking that new Orders only use existing items from "Item Table"
//
//////////////////////// Stretch Goal 3 ////////////////////
// 1) Additional complexity 
//////////////////////// Stretch Goal 4 ////////////////////
// 1) GUIfy it!
////////////////////////////////////////////////////////////

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended: true,
  })
)

// Submit Sales Order Function

// Generate HTML PAGE with 4 fields
// Onsubmit push -> item, quantity, dateOrdered, customerId
// onSubmit() Function 
//     Run 'INSERT INTO "salesOrder" ("item", "qty", "dateOrdered", "customerId") VALUES ($1, $2, $3)', ['item', 'qty', 'dateOrdered', 'customerId'],
//     Print to Screen -> Notification to Sales Rep 

//viewOrders(myRepNumber)
//      'SELECT * FROM salesOrder WHERE dateRecieved != null && (RepID == null OR RepID == myrepNumber)'
//      Print to screen the Order numbers
//      Sales Rep clicks an order for more detail
//viewOrderDetail()
//      'SELECT * FROM salesOrder WHERE orderId == $1', ['OrderId']
//      Print to screen a list of all items with quantity to screen
//          Add drop down menu with manufactures 
//submitPurchaseOrder()
//      Error checking all items from sales order have a manufacture
//      #TODO - Remove Sales Order Table -- Add Fields  "MFID", "PurchaseOrder (T/F)"  -- Create logic purchase order only possible if all items in OrderId have MFID 
//      (foreach item in SalesOrder)
//             if (MFID.exists){count++}
//               if count === total#ofItemsInOrder {
//                   'UPDATE "salesOrder" SET "MFID" = $1, "PurchaseOrder" = true, ['MFID', 'PurchaseOrder']
//               } 


//      Original
//      INSERT INTO "purchaseOrder" ("itemId", "qty", "dateOrdered", "customerId***", "repId", "manufactureId") VALUES ($1,$2,$3,$4,$5,$6)',  ['itemId', 'qty', 'dateOrdered', 'customerId?', 'repId', 'manufactureId']

app.get('/createUser', db.createUser)
app.get('/userDetails/:id', db.userDetails)
app.put('/userUpdate/', db.updateUser)
app.delete('/userDelete/:id', db.deleteUser)
app.get('/allUsers', db.getUsers)

app.listen(port, () => { console.log(`App is currently running port ${port}`)})