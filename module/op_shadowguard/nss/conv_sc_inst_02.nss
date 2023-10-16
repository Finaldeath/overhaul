#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 2, GetPCSpeaker());

    object oPC = GetPCSpeaker();

    object oWP = GetWaypointByTag("WP_ST_0_TEST_BEGIN");

    location lWP = GetLocation(oWP);

    AssignCommand(OBJECT_SELF, ActionCastFakeSpellAtObject(SPELL_DIVINE_FAVOR, oPC));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), oPC);

    DelayCommand(3.0, AssignCommand(oPC, JumpToLocation(lWP)));
}
