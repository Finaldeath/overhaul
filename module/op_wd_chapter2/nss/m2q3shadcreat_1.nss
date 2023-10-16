//::///////////////////////////////////////////////
//:: Heartbeat
//:: m2q3ShadCreat_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the boy is gone for any reason, destroy self.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 28, 2001
//:://////////////////////////////////////////////

void main()
{
    if (!GetIsObjectValid(GetNearestObjectByTag("M2Q03CBOY")))
    {
        DestroyObject(OBJECT_SELF);
    }
}
