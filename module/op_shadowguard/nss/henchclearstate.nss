#include "nw_i0_generic"
void main()
{
    SpeakString("I am running this script", TALKVOLUME_TALK);
    if(GetAssociateState(NW_ASC_AGGRESSIVE_SEARCH))
    {
     SetAssociateState(NW_ASC_AGGRESSIVE_SEARCH, FALSE);
     ActionDoCommand(ActionUseSkill(SKILL_SEARCH, OBJECT_SELF));
    }
    if(GetAssociateState(NW_ASC_AGGRESSIVE_STEALTH))
    {
     SetAssociateState(NW_ASC_AGGRESSIVE_STEALTH, FALSE);
     ActionDoCommand(ActionUseSkill(SKILL_HIDE, OBJECT_SELF));
    }
}
