//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Player Chooses to Forego Tarot
//:: WW1_Hag_NoTarot.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as already having died 3
     times. This will cause them to be sent
     straight to Stygia OnDeath  as they have
     chosen to forego that Night Hag's
     intervention.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 18, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "iDeaths", 4);
    SetLocalInt(oPC, "CONV_NIGHT_HAG_Refused", TRUE);
}
