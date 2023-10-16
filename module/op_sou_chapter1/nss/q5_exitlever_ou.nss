//::///////////////////////////////////////////////
//:: main doors exit-lever on-used
//:: q5_maillever_ou
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Just to allow a player to open the door from the other side
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 14/2/2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    string sTag = GetTag(OBJECT_SELF);
    string sNum = GetStringRight(sTag, 1);
    int nLeverNum = StringToInt(sNum);

    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    string sDoorTag = "Q5A_MAIN_DOOR" + IntToString(nLeverNum);
    object oDoor = GetNearestObjectByTag(sDoorTag);

    if(GetIsOpen(oDoor))
        return;

    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));

}
