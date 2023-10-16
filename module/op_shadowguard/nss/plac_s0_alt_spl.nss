#include "help_general"

void main()
{
    if (GetLastSpellHarmful())
    {
        object oCaster = GetLastSpellCaster();

        string s = "[As you unleash your magical power upon the altar, the delicate sorceries surrounding it unravel, causing it to quickly crumble into rubble...]";

        SceneSpeak(oCaster, s);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
    }
}
