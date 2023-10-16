//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Adam is following PC and has the baby.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 24, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nFollow")==1
        && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q1hbaby")))
        return TRUE;
    return FALSE;
}
