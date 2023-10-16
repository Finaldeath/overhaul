//::///////////////////////////////////////////////
//:: Used
//:: m1s4ExitArena04
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Exits the PC from the arena level 4 and destroys
    challenger.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oClaudus = GetObjectByTag("M1S04CCLAUDUS02");
    object oBeast1 = GetObjectByTag("M1S4FBeast",0);
    object oBeast2 = GetObjectByTag("M1S4FBeast",1);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    SetLocalInt(oPC,"NW_L_M1S4Won",FALSE);
    if (GetIsObjectValid(oClaudus) == FALSE &&
        GetIsObjectValid(oBeast1) == FALSE &&
        GetIsObjectValid(oBeast2) == FALSE)
    {
        CreateItemOnObject("M1S04IBADGELVL04",oPC);
        SetLocalObject(GetArea(GetWaypointByTag("M1S4ARENAEXIT")),"NW_G_M1S4BLastFought",oPC);
        SetLocalInt(oPC,"NW_L_M1S4Won",TRUE);
    }
    else
    {
        CreateItemOnObject("M1S04IBADGELVL03",oPC);
        SetLocalInt(GetModule(),"NW_G_Map_M1S4F_Occupied",FALSE);
    }
    DestroyObject(oClaudus);
    DestroyObject(oBeast1);
    DestroyObject(oBeast2);

    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_M1S4ClaudusDef",0);
    AssignCommand(oPC,JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENAEXIT"))));
}
