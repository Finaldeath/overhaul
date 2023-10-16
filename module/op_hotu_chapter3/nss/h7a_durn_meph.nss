//::///////////////////////////////////////////////
//:: Durnan, Mephistopheles Appears (Action Script)
//:: H9a_Durn_Meph.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn in Mephistopheles and start the
     cutscene (possibly after a short delay)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
/*DEBUG*///SendMessageToPC(oPC, "DEBUG: Mephistopheles' appearance to be scripted by Brad!");
}
