#include "NW_I0_Plot"

void AnimalGoToTree(object oPC);

void main()
{
    // Release the animal from domination if it has been dominated.
    object oMaster = GetMaster();
    if ( GetIsObjectValid(oMaster) )
    {
        effect eEffect = GetFirstEffect(OBJECT_SELF);
        while ( GetIsEffectValid(eEffect) )
        {
            int nEffectType = GetEffectType(eEffect);
            if ( nEffectType == EFFECT_TYPE_DOMINATED )
            {
                RemoveEffect(OBJECT_SELF,eEffect);
            }
            eEffect = GetNextEffect(OBJECT_SELF);
        }
    }

    // Give the domination effect a chance to wear off first.
    object oPC = GetPCSpeaker();
    DelayCommand(1.0,AnimalGoToTree(oPC));
}

void AnimalGoToTree(object oPC)
{
    SignalEvent(OBJECT_SELF,EventUserDefined(900));
    // Only award the experience points once.
    if ( !GetLocalInt(OBJECT_SELF,"ANIMAL_QUEST_XP_GIVEN") )
    {
        RewardXP("m1q1_Zoo",10,oPC);
    }
    SetLocalInt(GetModule(),"NW_G_M1S5MainPlot",15);
    SetLocalInt(OBJECT_SELF,"ANIMAL_QUEST_XP_GIVEN",1);
}

