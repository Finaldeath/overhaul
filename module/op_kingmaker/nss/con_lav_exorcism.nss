//::///////////////////////////////////////////////
//:: con_lav_exorcism.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Lavos performs her exorcism of the Haunted
     House.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 9, 2004
//:://////////////////////////////////////////////

void main()
{
    //Update the Haunted House plot variable.
    object oPC = GetPCSpeaker();
    object oMW = GetItemPossessedBy(oPC, "os_magicweapon");
    int iCharge = GetItemCharges(oMW);
    effect eVFX = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);

    ActionPauseConversation();

    //Alter the Haunted House to its Exorcised state.
    SetLocalInt(GetModule(), "OS_SERAH_HOMESOLD", 30);
    DestroyObject(GetObjectByTag("q2_candelabra"));
    DestroyObject(GetObjectByTag("q2_suitofarmor"));
    SetEncounterActive(FALSE, GetObjectByTag("q2_enc_incorp", 0));
    SetEncounterActive(FALSE, GetObjectByTag("q2_enc_incorp", 1));

    //Decrement the charges on the Magic Weapon.
    SetItemCharges(oMW, (iCharge - 2));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oPC);
    AddJournalQuestEntry("q2_hauntedhouse", 40, oPC);
    GiveXPToCreature(oPC, 400);

    ActionResumeConversation();
}
