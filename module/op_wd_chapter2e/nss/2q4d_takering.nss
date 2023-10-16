//::///////////////////////////////////////////////
//:: Take Brother's Ring
//:: 2q4d_takering
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Evaine will take the signet ring from the
    player when she is done.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 27, 2002
//:://////////////////////////////////////////////

void main()
{
    object oRing = GetItemPossessedBy(GetPCSpeaker(), "Elynwyd_Ring");
    if(GetIsObjectValid(oRing))
    {
        DestroyObject(oRing, 0.0);
    }
}
