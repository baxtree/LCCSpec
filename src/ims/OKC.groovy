package ims

class OKC {
	def payby = {CreditCard->
		return true;	
	}
	def display = {Receipt->
		return true;	
	}
	def search = {Title, Price->
		return true;	
	}
	def enoughCredit = {CreditCard, Price, Receipt->
		return true;	
	}
}
