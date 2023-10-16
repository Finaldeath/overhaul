//::///////////////////////////////////////////////
//:: Used
//:: m1s4ExitArena03
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Exits the PC from the arena level 3 and destroys
    challenger.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oAgar = GetObjectByTag("M1S04CAGAR02");
    object oBeast = GetObjectByTag("M1S4EBeast");
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    SetLocalInt(oPC,"NW_L_M1S4Won",FALSE);
    if (GetIsObjectValid(oAgar) == FALSE &&
        GetIsObjectValid(oBeast) == FALSE)
    {
        CreateItemOnObject("M1S04IBADGELVL03",oPC);
        SetLocalObject(GetArea(GetWaypointByTag("M1S4ARENAEXIT")),"NW_G_M1S4BLastFought",oPC);
        SetLocalInt(oPC,"NW_L_M1S4Won",TRUE);
    }
    else
    {
        CreateItemOnObject("M1S04IBADGELVL02",oPC);
    }
    DestroyObject(oAgar);
    DestroyObject(oBeast);
    SetLocalInt(GetModule(),"NW_G_Map_M1S4E_Occupied",FALSE);
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_M1S4AgarDef",0);
    AssignCommand(oPC,JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENAEXIT"))));
}
