public with sharing class HerokuCommandRefController {

    public List<HerokuCommand__c> records { get; set; }
    public String selectedCategory { get; set; }

    public HerokuCommandRefController() {
        this.records = queryAll();
    }

    private List<HerokuCommand__c> queryAll() {
        return [SELECT Id, Name, Description__c, Category__c FROM HerokuCommand__c ORDER BY Category__c, Name ASC];
    }

    public PageReference queryByCategory() {
    	this.records = [SELECT Id, Name, Description__c, Category__c FROM HerokuCommand__c WHERE Category__c =: this.selectedCategory ORDER BY Category__c, Name ASC];
    	return null;
    }
}