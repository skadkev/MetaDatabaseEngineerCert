#Create a class called Bank and pass ABC to it. 

from abc import ABC, abstractmethod

class Bank(ABC):
    def basicinfo(self):
        print("This is a generic bank")
        return "Generic bank: 0"
    
    @abstractmethod
    def withdraw(self):
        pass

class Swiss(Bank):
    def __init__(self, bal = 1000) -> None:
        self.bal = bal
    
    def basicinfo(self):
        print("This is the Swiss Bank")
        return "Swiss Bank: " + str(self.bal)
    
    def withdraw(self, amount):
        if amount <= self.bal:
            self.bal = self.bal - amount
            print("Withdrawn amount: " + str(amount))
            print("New balance: " + str(self.bal))
        else:
            print("Insufficient funds " + str(amount))
        
        return self.bal





