void main()
{
    int nMax = GetMaxHitPoints();
    int nCurrent = GetCurrentHitPoints();
    object oFaction = GetObjectByTag("M3Q3_FACTION_BARREL");
    object oWay = GetWaypointByTag("M3Q3_RETREAT");
    
    if((nCurrent*2) < nMax)
    {
        ClearAllActions();
        SetLocalInt(GetModule(), "PLOT", 2);
        SpeakString("Stand down");
        ChangeFaction(OBJECT_SELF, oFaction);
        
        int nCnt = 1;
        object oFrnd = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
        while(GetIsObjectValid(oFrnd))
        {
            ClearAllActions();
            ActionForceMoveToObject(oWay, TRUE);
            ChangeFaction(oFrnd, oFaction);
            nCnt++;
            oFrnd = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
        }
    }
}
