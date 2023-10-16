//::///////////////////////////////////////////////
//:: Entered
//:: M2Entered
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Heal the PC on entering the module.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    object oItem;

//    ActionCastSpellAtObject(SPELL_GREATER_RESTORATION,oPC,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    AddJournalQuestEntry("m2q0_Main",10,oPC);

    oItem = GetItemPossessedBy(oPC,"M1Q6F8Rituals");
    if (GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
    }
    oItem = GetItemPossessedBy(oPC,"M1Q6Book_Helm");
    if (GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
    }
    oItem = GetItemPossessedBy(oPC,"M1Q6B09Key");
    if (GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
    }
    oItem = GetItemPossessedBy(oPC,"M1Q6FHelmGem");
    if (GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
    }
}
