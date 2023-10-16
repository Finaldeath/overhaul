// Creating a scaled number of golems

#include "nw_i0_generic"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    int nTotalLevels = GetCharacterLevel(oPC);

    object oHench1 = GetHenchman(oPC, 1);
    object oHench2 = GetHenchman(oPC, 2);
    if(oHench1 != OBJECT_INVALID && oHench2 != OBJECT_INVALID) nTotalLevels *= 3;
    else if(oHench1 != OBJECT_INVALID) nTotalLevels *= 2;

    object oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        if(oPlayer != oPC)
            nTotalLevels += GetCharacterLevel(oPlayer);
        oPlayer = GetNextPC();
    }

    int nGolemsNum;
    if(nTotalLevels <= 20) // single player
        nGolemsNum = 2;
    else if(nTotalLevels >= 21 && nTotalLevels <= 40) // 1 henchmen
        nGolemsNum = 3;
    else if(nTotalLevels >= 41 && nTotalLevels <= 60) // 2 henchmen
        nGolemsNum = 4;
    else
        nGolemsNum = 5; // epic

    object oWP;
    string sType = GetStringRight(GetTag(OBJECT_SELF), 1); // "1" for right, "2" for left
    if(sType == "1") // right area
       oWP = GetWaypointByTag("q4c_wp_create_right");
    else
       oWP = GetWaypointByTag("q4c_wp_create_left");

    int i;
    object oWPRight = GetWaypointByTag("q4c_wp_attack_right");
    object oWPLeft = GetWaypointByTag("q4c_wp_attack_left");
    object oWPFront = GetWaypointByTag("q4c_wp_attack_front");
    int nDirection = 0; // 0 to set th golem to run to the side, 1 to set him to run to the front
    object oGolem;
    for(i = 1; i <= nGolemsNum; i++)
    {
        oGolem = CreateObject(OBJECT_TYPE_CREATURE, "goldgolem002", GetLocation(oWP));
        if(nDirection == 0)
        {
            // run to the side
            if(sType == "1") // right
                SetLocalObject(oGolem, "RUNTO", oWPRight);
            else if(sType == "2")
                SetLocalObject(oGolem, "RUNTO", oWPLeft);
            nDirection = 1;
         }
         else
         {
            SetLocalObject(oGolem, "RUNTO", oWPFront);
            nDirection = 0;
         }
    }
}
