//*Klauth takes an orb
/*fancy glowing effect on Klauth, remove sphere from inventory, give PC 5000 gold -

if Klauth has been poisoned by the PC (given (MLiSpDeadDrag3Q4)
the glowing effect is black and he ends dialog and goes hostile.
He attacks and displays a string that reads:

Betrayal!  The tainted essence of a dead dragon!  Now you will die!*/
#include "nw_i0_plot"
#include "m3plotinclude"
#include "nw_i0_generic"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q4HC_DRAGONSPHERE",1);
    RewardGP(5000, GetPCSpeaker());
    effect eVis = EffectVisualEffect(VFX_IMP_DEATH_L);

    // * Take one sphere from the player, in this order of priority: Dead, Full
    if (TakeDeadSphere(GetPCSpeaker()) == TRUE)
    {
        // * Dragon gets mad
        eVis = EffectVisualEffect(VFX_IMP_DEATH_L);
//        AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
        effect eDam = EffectDamage(500, DAMAGE_TYPE_DIVINE, DAMAGE_POWER_PLUS_FIVE);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDam, OBJECT_SELF);
//        DetermineCombatRound(GetPCSpeaker());

        SetLocalInt(OBJECT_SELF, "NW_L_BETRAYED",1);
//        SpeakOneLinerConversation();
        ActionStartConversation(GetPCSpeaker());
    }
    else
    if (TakeAliveSphere(GetPCSpeaker()) == TRUE)
    {
        // * Do nothing, dragon is happy, play nice visual effect
        eVis = EffectVisualEffect(VFX_FNF_LOS_HOLY_30);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
}
