public class MyDemo {
    public static void tickMark() {
        List<Account> accList = [SELECT Id, Name, 
                                 (Select Id, AccountId, IsPrivate 
                                  FROM Opportunities  
                                  ORDER BY CreatedDate DESC) 
                                 FROM Account];
        List<Opportunity> oppList = new List<Opportunity>();
        if(!accList.isEmpty()){
            for(Account acc : accList) {
                for(Opportunity opp : acc.Opportunities) {
                    Opportunity oppRec = new Opportunity();
                    oppRec.id = opp.id;
                    oppRec.IsPrivate = False;
                    oppList.add(oppRec);
                }
            }
        }
        if(!oppList.isEmpty()) {
            update oppList;
        }
        
        List<Account> accList2 = [SELECT Id, Name, 
                                 (Select Id, AccountId, IsPrivate 
                                  FROM Opportunities  
                                  ORDER BY CreatedDate DESC  LIMIT 1) 
                                 FROM Account];
        List<Opportunity> oppList2 = new List<Opportunity>();
        if(!accList.isEmpty()){
            for(Account acc2 : accList2) {
                for(Opportunity opp2 : acc2.Opportunities) {
                    Opportunity oppRec2 = new Opportunity();
                    oppRec2.id = opp2.id;
                    oppRec2.IsPrivate = True;
                    oppList2.add(oppRec2);
                }
            }
        }
        if(!oppList2.isEmpty()) {
            update oppList2;
        }
        
    }
}  