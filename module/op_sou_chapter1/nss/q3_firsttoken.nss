// Make sure the PC speaker
// has at least one token in their inventory
// and the pool currently has no tokens in it

#include "nw_i0_tool"

int StartingConditional()
{
    int nToken = GetLocalInt(OBJECT_SELF, "q3_Tokens_Thrown");

    if ((HasItem(GetPCSpeaker(),"Q3B_TOKEN")) && (nToken == 0))
    {
        return TRUE;
    }
    return FALSE;
}
