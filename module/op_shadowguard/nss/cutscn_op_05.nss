#include "help_general"

void main()
{
    object oOldWoman = GetNearestObjectByTag("NW_OLDWOMAN_2");

    object oRakha = GetNearestObjectByTag("CT_UNIQ_NT_RAKH_1");

    RemoveAnimationPermanent(oOldWoman);

    RemoveAnimationPermanent(oRakha);

    AssignCommand(oRakha, ActionCastFakeSpellAtObject(SPELL_HEAL, oOldWoman));

}
