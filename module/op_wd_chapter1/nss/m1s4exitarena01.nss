//::///////////////////////////////////////////////
//:: Used
//:: m1s4ExitArena01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Exits the PC from the arena level 1 and destroys
    challenger.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oHrusk = GetObjectByTag("M1S04CHRUSK02");
    object oBeast = GetObjectByTag("M1S4CBeast");
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    SetLocalInt(oPC,"NW_L_M1S4Won",FALSE);
   // if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_M1S4HruskDef") == 1 &&
   //     GetLocalInt(GetArea(OBJECT_SELF),"NW_A_M1S4CBeastDef"))
    if(GetIsObjectValid(oHrusk) == FALSE &&
       GetIsObjectValid(oBeast) == FALSE)
    {
        CreateItemOnObject("M1S04IBADGELVL01",oPC);
        SetLocalObject(GetArea(GetWaypointByTag("M1S4ARENAEXIT")),"NW_G_M1S4BLastFought",oPC);
        SetLocalInt(oPC,"NW_L_M1S4Won",TRUE);
    }
    DestroyObject(GetObjectByTag("M1S04CHRUSK02"));
    DestroyObject(GetObjectByTag("M1S4CBeast"));
    SetLocalInt(GetModule(),"NW_G_Map_M1S4C_Occupied",FALSE);
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_M1S4HruskDef",0);
    AssignCommand(oPC,JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENAEXIT"))));

}
