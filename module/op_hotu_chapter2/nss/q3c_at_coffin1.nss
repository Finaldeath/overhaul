// Kill the vampire of this coffin and award XP.

#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(OBJECT_SELF, "HAS_VAMPIRE", 0);
    effect eVis = EffectVisualEffect(VFX_IMP_DEATH_L);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    object oStake = GetItemPossessedBy(oPC, "q3c_stake");
    DestroyObject(oStake);
    string sTag = GetTag(OBJECT_SELF);
    int nNumLen = GetStringLength(sTag) - GetStringLength("q3c_coffin");
    int nNum = StringToInt(GetStringRight(sTag, nNumLen));
    if(nNum == 9 || nNum == 1)
        Reward_2daXP(oPC, 23);
    else
        Reward_2daXP(oPC, 21);

}
