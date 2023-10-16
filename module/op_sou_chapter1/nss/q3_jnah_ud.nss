// bring kobold when battle starts.

#include "q3_inc_plot"

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT)
    {
        if(!GetIsInCombat())
            return;
        object oWP = GetWaypointByTag("Q3C_CHEIF_ARRIVE");
        int nHelp = GetLocalInt(GetModule(), "Q3_GNOLL_HELP");
        if(nHelp == GNOLL_NOHELP)
            return;
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CHIEF_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_CHIEF_ONCE", 1);

        object oGishnak = GetObjectByTag("Q3_CHIEF_GISHNAK");
        if(oGishnak != OBJECT_INVALID)
            DestroyObject(oGishnak);
        object oNewGishnak = CreateObject(OBJECT_TYPE_CREATURE, "q3_chief_gishnak", GetLocation(oWP));
        SetImmortal(oNewGishnak, FALSE);
        CreateObject(OBJECT_TYPE_CREATURE, "q3_gnoll_help", GetLocation(oWP));
        CreateObject(OBJECT_TYPE_CREATURE, "q3_gnoll_help", GetLocation(oWP));
        CreateObject(OBJECT_TYPE_CREATURE, "q3_gnoll_help", GetLocation(oWP));
        CreateObject(OBJECT_TYPE_CREATURE, "q3_gnoll_help", GetLocation(oWP));
        AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oNewGishnak), oNewGishnak, 50);
    }
    else if (nEvent == 1007)
    {
        SetLocalInt(GetModule(), "X1_JNAH_STATUS", 3);

    }

}
