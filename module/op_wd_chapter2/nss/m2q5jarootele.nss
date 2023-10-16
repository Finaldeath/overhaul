#include "NW_I0_PLOT"

void main()
{
    TakeGold(500,GetPCSpeaker(),TRUE);
    SetLocalInt(GetPCSpeaker(),"NW_L_M2Q5EnteredDungeon",10);
    SetLocalInt(GetModule(),"NW_G_M2Q5DungeonEntered",20);
    AssignCommand(GetPCSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("WP_M2Q5P_M2Q5Q"))));
}
