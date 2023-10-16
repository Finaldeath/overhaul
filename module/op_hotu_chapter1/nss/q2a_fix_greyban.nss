//::///////////////////////////////////////////////
//:: Name: q2a_fix_greyban
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Greyban's shield is returned, at the end of
    conversation destroy this greyban, then create
    the new one.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 29/02
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nGraybanfixed") == 1)
    {
        location lGreyban = GetLocation(GetWaypointByTag("q2a_graybanspawn"));
        AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_FIREFORGET_BOW));
        DestroyObject(OBJECT_SELF, 2.0);
        CreateObject(OBJECT_TYPE_CREATURE, "q2a_graybanfix", lGreyban);
    }
}
