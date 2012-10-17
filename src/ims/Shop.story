package ims
// --- OKCs
def search = {Title, Price->
	return true
}
def enoughCredit = {CreditCard, Price, Receipt->
	return true
}
// OKCs ---
before "interaction", {
	given "I have a Jabber ID, #sid", {
		sid = "bob@okbook.inf.ed.ac.uk"	
	}	
	and "I have known a client's Jabber ID, #cid", {
		cid = "alice@okbook.inf.ed.ac.uk"
	}
}

scenario "receive a book title and a credit card number from the client and send back the receipt for that book [[a(shop, S)::]]",{
	when "receive the book title and the credit card number from #cid [[buy(Title, CreditCard) <= a(client(Title, CreditCard, S), C)]]", {
//		receive(buy(Title, CreditCard), cid)
		title = "Harry Potter"
		creditCard = "1234567890123456"
	}
	then "find the book from the store and check the remaining credit and generate receipt [[<-search(Title, Price) && enoughCredit(CreditCard, Price, Receipt)]]", {
		def price, receipt
		search(title, price).shouldBe true
		enoughCredit(creditCard, price, receipt).shouldBe true
	}
	then "send the receipt back from #sid to #cid [[receipt(Receipt) => a(client(_, _, _), C)]]", {
//		send(receipt(Receipt), cid)
	}
}