// Ayala uses the herbs to cure Drogan

#include "NW_I0_PLOT"

void main()
{
    object oItem1 = GetItemPossessedBy(OBJECT_SELF, "q1cureing1");
    object oItem2 = GetItemPossessedBy(OBJECT_SELF, "q1cureing2");
    object oItem3 = GetItemPossessedBy(OBJECT_SELF, "q1cureing3");
    DestroyObject(oItem1);
    DestroyObject(oItem2);
    DestroyObject(oItem3);

    object oDrogan = GetObjectByTag("Drogan");
    SetLocalInt(oDrogan, "X1_nCured", 1);
    SetPLocalInt(GetPCSpeaker(), "Drogan_Herbs", 2);
    AddJournalQuestEntry("q1cure", 50, GetPCSpeaker());
    RewardXP("xpmid", 100, GetPCSpeaker(), ALIGNMENT_NEUTRAL, TRUE);

    SetLocalInt(OBJECT_SELF, "nDroganHerbsTaken", 2);
    ActionPauseConversation();

    //AssignCommand(OBJECT_SELF, SetFacingPoint(GetPosition(oDrogan)));
    AssignCommand(OBJECT_SELF, ActionMoveToObject(oDrogan, FALSE, 0.5));
    AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 0.7, 3.0));
    SetLocalInt(GetModule(), "Drogan_Healed", 1);
    effect eHeal = EffectHeal(70);
    effect eVis = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eLink = EffectLinkEffects(eHeal, eVis);
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oDrogan));
    DelayCommand(5.0, ActionResumeConversation());
}
