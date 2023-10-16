//::///////////////////////////////////////////////
//:: Name: act_q2d2hallgd_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Store the PCs helmet so it can be destroyed later
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHelm = GetItemPossessedBy(oPC, "q2dmentalshield");
    SetLocalObject(OBJECT_SELF, "oHelmet", oHelm);
}
