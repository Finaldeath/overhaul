#include "help_general"

void main()
{
    int nInt = GetLocalInt(OBJECT_SELF, "N_COMBINATION");

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectParalyze(), GetPCSpeaker(), 20.0);
}
