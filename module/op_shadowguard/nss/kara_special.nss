#include "help_hench"

void main()
{
    object oPC = GetFirstPC();
    object oPriest = OBJECT_SELF;
    object oDisciple1 = GetNearestObjectByTag("CT_COMM_AK_DISC", oPriest, 1);
    object oDisciple2 = GetNearestObjectByTag("CT_COMM_AK_DISC", oPriest, 2);
    int iAverage = GetMaxHitPoints(oPriest) + GetMaxHitPoints(oDisciple1)
        + GetMaxHitPoints(oDisciple2);

    iAverage = (iAverage/3)/2;

    if (GetLocalInt(oPC, "N_TOOK_BLOODSTONE") != 1)
    {
        object oKara = GetNearestObjectByTag("HENCH_KARA", oPC);
        effect eVFX = EffectVisualEffect(VFX_IMP_DESTRUCTION);
        effect eDamage = EffectDamage(iAverage);

        AssignCommand(oKara,
            ActionCastFakeSpellAtObject(SPELL_EPIC_MUMMY_DUST, oPriest));

        DelayCommand(3.0f, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oPriest));
        DelayCommand(3.6f, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPriest));

        DelayCommand(3.1f, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oDisciple1));
        DelayCommand(3.7f, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDisciple1));

        DelayCommand(3.2f, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oDisciple2));
        DelayCommand(3.8f, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDisciple2));
    }

    string s = GetJournalQuest(GetTag(OBJECT_SELF));
    AddJournalSingle(s, 18, oPC);
}
