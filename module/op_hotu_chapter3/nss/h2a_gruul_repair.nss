//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Repair Grinder 5 (Action Script)
//:: H2a_Gruul_Repair.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Repairs a dismantled Quarry Grinder 5 and
     reactivates it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

void main()
{
    object oGrinder = GetObjectByTag("QuarryGrinder5");
    SetLocalInt(oGrinder, "bDismantled", FALSE);
    SetLocalInt(oGrinder, "bActivated", TRUE);
    SetLocalInt(oGrinder, "bQuestComplete", TRUE);

    // Brad Prince - Gold needs to be taken.
    TakeGoldFromCreature(30000, GetPCSpeaker(), TRUE);
}
