//::///////////////////////////////////////////////
//:: Used
//:: M2Q3KA_GHOULLVR
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the Ghoul doors.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 15, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor1 = GetObjectByTag("M2Q3KA_GHOULD1");
    object oDoor2 = GetObjectByTag("M2Q3KA_GHOULD2");

    if (GetLocalInt(OBJECT_SELF,"NW_L_Activate") == 0)
    {
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocalInt(OBJECT_SELF,"NW_L_Activate",1);
    }
    else
    {
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SetLocalInt(OBJECT_SELF,"NW_L_Activate",0);
    }
    SetLocked(oDoor1,FALSE);
    SetLocked(oDoor2,FALSE);
    AssignCommand(oDoor1,ActionOpenDoor(oDoor1));
    AssignCommand(oDoor2,ActionOpenDoor(oDoor2));
}
