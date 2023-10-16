#include "NW_I0_GENERIC"

void main()
{
    ActionPauseConversation();
    if (TalentSummonAllies()) return;
    int iBuffed = TalentUseProtectionOthers(GetPCSpeaker());
//    if (!iBuffed) iBuffed = TalentEnhanceOthers(GetPCSpeaker(),TRUE);
    if (!iBuffed) iBuffed = TalentEnhanceOthers();
    SetLocalInt(GetPCSpeaker(),"BuffedUp",iBuffed);
    ActionResumeConversation();
}
