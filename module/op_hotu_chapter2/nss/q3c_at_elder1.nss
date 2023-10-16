// Attack

#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();
    object oGolem1 = GetNearestObjectByTag("NW_GolBone", OBJECT_SELF, 1);
    object oGolem2 = GetNearestObjectByTag("NW_GolBone", OBJECT_SELF, 2);

    PlayVoiceChat(VOICE_CHAT_BATTLECRY1, OBJECT_SELF);
    AdjustReputation(OBJECT_SELF, oPC, -100);
    AdjustReputation(oPC, OBJECT_SELF, -100);

    DetermineCombatRound(oPC);

    DelayCommand(1.5, AssignCommand(oGolem1, DetermineCombatRound(oPC)));
    DelayCommand(1.5, AssignCommand(oGolem2, DetermineCombatRound(oPC)));
}
