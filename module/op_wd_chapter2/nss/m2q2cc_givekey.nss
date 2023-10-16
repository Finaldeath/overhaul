//::///////////////////////////////////////////////
//:: M2Q2CC_GIVEKEY.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gives the key to the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oKey = GetItemPossessedBy(OBJECT_SELF, "M2Q2CC_KEY");
    int iJaxState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q2_Jax");

    if (GetIsObjectValid(oKey))
    {
        ActionPauseConversation();
        ActionGiveItem(oKey, GetPCSpeaker());
        SetLocalInt(GetPCSpeaker(),"M2Q2CC_L" + GetTag(OBJECT_SELF),2);
        object oTarget = OBJECT_SELF;
        effect eTelVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eTelVis, oTarget);
        ActionResumeConversation();
        DestroyObject(OBJECT_SELF,2.0);
        //ActionJumpToObject(GetObjectByTag("WP_M2Q2CC_STGOLEM"));
    }

    if (iJaxState > 0 && iJaxState < 36)
    {
        AddJournalQuestEntry("m2q2_Jax", 36, oPC);
    }
}
