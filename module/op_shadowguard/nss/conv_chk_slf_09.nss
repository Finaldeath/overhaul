// The conv_chk_slf_* scripts check to see whether the
// variable "N_TALK_SWITCH" is set, and then check
// the Talk Level of the NPC by the NPC's Variable
// "N_TALK_LVL_" + <Tag of NPC>, stored in the
// Module's list of variables.

#include "help_conv"

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_TALK_SWITCH") == 0)
        return FALSE;

    if (GetSelfTalkLevelInt(OBJECT_SELF) == 9)
        return TRUE;


    return FALSE;
}
