#include "help_general"

void main()
{
    object oOldMan = GetNearestObjectByTag("NW_OLDMAN_2");

    RemoveAnimationPermanent(oOldMan);

    object oRakha = GetNearestObjectByTag("CT_UNIQ_NT_RAKH_1");

    DoAnimationPermanent(oRakha, ANIMATION_LOOPING_GET_LOW);
}
