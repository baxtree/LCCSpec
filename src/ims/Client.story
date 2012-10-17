package ims
// --- OKCs
def payby = {CreditCard->
	return true
}
def display = {Receipt->
	return true
}
// OKCs ---
before "interaction", {
	given "I have a Jabber ID, #cid", {
		cid = "alice@okbook.inf.ed.ac.uk"
	}
	and "I have known a book title, #title", {
		title = "Harry Potter"
	}
	and "I have my credit card number, #creditCard", {
		creditCard = "1234567890123456"
	}
	and "I have know a online book shop's Jabber ID, #sid", {
		sid = "bob@okbook.inf.ed.ac.uk"
	}	
}
scenario "send the book title and the credit card number to the online book shop in order to buy that book [[a(client(Title, CreditCard, S), C)::]]", {
	then "I decide to pay with #creditCard  [[<-payby(CreditCard)]]", {
		payby(creditCard).shouldBe true
	}
	then "send #title and #creditCard from #sid to #sid [[buy(Title, CreditCard) => a(shop, S)]]", {
//		send(buy(title, creditCard), sid) 
	}
	when "receive the receipt from #id [[receipt(Receipt) <= a(shop, S)]]", {
//		receive(receipt(Receipt), sid)
		receipt = "receipt";
	}
	then "display the receipt, #receipt, on my screen [[display(Receipt)]]", {
		display(receipt).shouldBe true
	}	
}
