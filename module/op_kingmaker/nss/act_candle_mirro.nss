//::///////////////////////////////////////////////
//:: act_candle_mirro.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the player Lady Rehan's mirror.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 9, 2004
//:://////////////////////////////////////////////
void main()
{
    //Flag the DoOnce
    object oPC = GetFirstPC();

    if (GetLocalInt(OBJECT_SELF, "bGaveMirrorToPC") == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bGaveMirrorToPC", TRUE);

        //Give the mirror
        SetLocalInt(GetModule(), "OS_SERAH_HOMESOLD",40);
        CreateItemOnObject("km_ghost_rhmirrr", oPC);
        AddJournalQuestEntry("q2_hauntedhouse", 50, oPC);
        GiveXPToCreature(oPC, 400);
    }
}
