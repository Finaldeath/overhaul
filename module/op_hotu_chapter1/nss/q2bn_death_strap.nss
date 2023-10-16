//::///////////////////////////////////////////////
//:: Name q2bn_death_strap
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroy the Trap when the Gargoyle is destroyed
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 14/02
//:://////////////////////////////////////////////


void main()
{
    object oInvis = GetObjectByTag("tgt_" + GetTag(OBJECT_SELF));
    DestroyObject(oInvis);
    DestroyObject(GetNearestObjectByTag(GetTag(OBJECT_SELF)));

}
