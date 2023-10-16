//::///////////////////////////////////////////////
//:: Used
//:: m1s4ExitArena02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Exits the PC from the arena level 2 and destroys
    challenger.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oFashi = GetNearestObjectByTag("M1S04CFASHI02");
    object oBeast = GetNearestObjectByTag("M1S4DBeast");
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    SetLocalInt(oPC,"NW_L_M1S4Won",FALSE);
    if (GetIsObjectValid(oFashi) == FALSE &&
        GetIsObjectValid(oBeast) == FALSE)
    {
        CreateItemOnObject("M1S04IBADGELVL02",oPC);
        SetLocalObject(GetArea(GetWaypointByTag("M1S4ARENAEXIT")),"NW_G_M1S4BLastFought",oPC);
        SetLocalInt(oPC,"NW_L_M1S4Won",TRUE);
    }
    else
    {
        CreateItemOnObject("M1S04IBADGELVL01",oPC);
    }
    DestroyObject(oFashi);
    DestroyObject(oBeast);
    SetLocalInt(GetModule(),"NW_G_Map_M1S4D_Occupied",FALSE);
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_M1S4FashiDef",0);
    AssignCommand(oPC,JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENAEXIT"))));
}
