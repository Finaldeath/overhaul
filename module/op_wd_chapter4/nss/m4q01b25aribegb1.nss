///////escape area and appear inside Nasher's dungeon, set Aribeth to not hostile
//sets surrender to 1 to show that she has surrendered and is leaving for Nash's cell
     #include "NW_I0_GENERIC"

#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(),"NW_M4Q1_AribethHostile",0);
    AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), OBJECT_SELF, 100);
    SetLocked(GetNearestObjectByTag("M4Q1B25InnerDoor"),FALSE);
    AssignCommand(GetNearestObjectByTag("M4Q1B25InnerDoor"), ActionOpenDoor(GetNearestObjectByTag("M4Q1B25InnerDoor")));
    ActionMoveToObject(GetNearestObjectByTag("NW_EXIT"));
    ActionJumpToObject(GetObjectByTag("M4_ARIBETH_CELL"));
    object oSword = GetItemPossessedBy(OBJECT_SELF,"NW_WSWMLS010");
    if(GetIsObjectValid(oSword))
    {
        DestroyObject(oSword);
    }
    SetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_SURRENDER",1);
    ActionDoCommand(SetCommandable(TRUE));
    SetCommandable(FALSE);
    RewardXP("M4Q01Aribeth",100,GetPCSpeaker());
    DestroyObject(GetItemPossessedBy(OBJECT_SELF,"M4AribSword"));
}


