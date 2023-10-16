#include "NW_I0_GENERIC"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES",GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") + 1);
    SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION, FALSE);
}
