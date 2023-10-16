// Cultists attack

#include "nw_i0_generic"

void main()
{
    object oPC = GetClickingObject();
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        AssignCommand(oHench, ClearAllActions());
        i++;
        oHench = GetHenchman(oPC, i);
    }

    object oCultist1 = GetNearestObjectByTag("q3a_cultist1");
    if(GetIsInCombat(oCultist1) || IsInConversation(oCultist1))
        return;


    vector vPos = GetPosition(oCultist1);
    AssignCommand(oCultist1, SetFacingPoint(GetPosition(oPC)));
    AssignCommand(oCultist1, PlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 0.9, 4.5));
    DelayCommand(3.0, AssignCommand(oCultist1, SetFacingPoint(vPos)));
    PlayVoiceChat(VOICE_CHAT_THREATEN, oCultist1);


}
