// Wild magic spell-script:
// all spells are

#include "x2_inc_switches"

void main()
{
    // Sanity check
    string sTag = GetTag(GetArea(OBJECT_SELF));
    if(GetStringLeft(sTag, 16) != "q6d_wizard_tower" || GetTag(OBJECT_SELF) == "q6_jansil")
        return;

    int nSpell = GetSpellId();
    object oItem = GetSpellCastItem();
    if(GetBaseItemType(oItem) == BASE_ITEM_POTIONS)
        return;
    if(nSpell == SPELL_RESURRECTION || nSpell == SPELL_RAISE_DEAD)
        return;
    int nRand = Random(100);
    if(nRand <= 50)
    {
        FloatingTextStrRefOnCreature(84829, OBJECT_SELF);
        ExecuteScript("q6_s3_rodwonder", OBJECT_SELF);
        SetModuleOverrideSpellScriptFinished();
    }
}
