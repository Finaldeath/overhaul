// Create slaadi in the portal room

#include "nw_i0_plot"
#include "NW_I0_GENERIC"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    int nTotalLevels = 0;
    object oPlayer = GetFirstPC();
    object oHench;
    while (oPlayer != OBJECT_INVALID)
    {
        nTotalLevels += GetCharacterLevel(oPlayer);
        if(GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayer) != OBJECT_INVALID)
            nTotalLevels += GetCharacterLevel(oPlayer);
        oPlayer = GetNextPC();
    }

    int nSlaadNum = 0;
    if(nTotalLevels <= 9)
        nSlaadNum = 2;
    else if(nTotalLevels <= 15)
        nSlaadNum = 3;
    else if(nTotalLevels <= 18)
        nSlaadNum = 4;
    else if(nTotalLevels <= 24)
        nSlaadNum = 5;
    else
        nSlaadNum = 6;

    int i;
    object oWP;
    string sTag;
    object oSlaad;
    for(i = 1; i <= nSlaadNum; i++)
    {
        sTag = "Q3B_WP_SLAAD_SP" + IntToString(i);
        oWP = GetWaypointByTag(sTag);
        oSlaad = CreateObject(OBJECT_TYPE_CREATURE, "slaadred001", GetLocation(oWP));
        SetLocalInt(oSlaad, "NOT_RESPOND_TO_SHOUT", 1); // used in the on-dialog events for the slaads
    }
}
