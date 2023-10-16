//::///////////////////////////////////////////////
//:: Name q1h1_ent_ktrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroy the baby hostage kobold if it enters
    this trigger.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oKobold = GetEnteringObject();
    if (GetTag(oKobold) == "q1h2_kblake")
        DestroyObject(oKobold, 1.0);
}
