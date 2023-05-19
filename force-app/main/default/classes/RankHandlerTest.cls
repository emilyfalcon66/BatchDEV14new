@isTest
public class RankHandlerTest {
    @isTest
    public static void testrankPrize() {
        RankHandler rankHandler = new RankHandler();
        for (Integer i = 1; i <= 3; i++) {
            string prize = rankHandler.rankPrize(i);
            assert.areEqual(i==1? 'Gold': i==2? 'Silver' : 'Bronze', prize);
        }
        for (Integer i = 4; i <=10; i++) {
            string prize = rankHandler.rankPrize(i);
            assert.areEqual('Top 10, congrats', prize);
        }
        for (Integer i=11; i< 100; i++){
            string prize = rankHandler.rankPrize(i);
            assert.areEqual('Thank you for participation',prize);
        }
    }
    @isTest
    public static void testrankPrizeSwitch() {
        RankHandler rankHandler = new RankHandler();
        for (Integer i = 1; i < =10; i++) {
            string prize = rankHandler.rankPrizeSwitch(i);
            assert.areEqual(i==1? 'Gold' : i==2? 'Silver' : i==3? 'Bronze': 'Top 10,congrats', prize);
        }
        for (Integer i = 11; i < 100; i++) {
            String prize = rankHandler.rankPrizeSwitch(i);
            assert.areEqual('Thank you for participation', prize);
        }
    }
}