#include "help_general"

void main()
{
    object oPC = GetLastUsedBy();

    if (GetIsPC(oPC))
    {
        int nDifficulty = Random(3) + 1;

        if (GetSkillRank(SKILL_SPELLCRAFT, oPC) >= nDifficulty)
        {
            AssignCommand(oPC, ClearAllActions());

            AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_STEAL));

            SceneSpeak(oPC, "[Spellcraft]  [Utilizing your knowledge of the arcane, you carefully rearrange the mystical runes covering this altar, creating a highly unstable force of energy to rip the stone block asunder...]");

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
        }

        else if (GetSkillRank(SKILL_DISABLE_TRAP, oPC) >= nDifficulty + 2)
        {
            AssignCommand(oPC, ClearAllActions());

            AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_STEAL));

            SceneSpeak(oPC, "[Disable Traps]  [Quickly studying the intricate arrangement of magical forces at work upon this altar, you cross several of the energy beams' paths upon one another, creating a highly unstable magical force which rips the stone block asunder...]");

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
        }

        else
            SceneSpeak(oPC, "[This altar seems to be the controlling focus of the Battle Constructs' power, but you cannot discern a way to disrupt the magical forces at work, short of possibly bashing the stone block into pieces...]");
    }
}
