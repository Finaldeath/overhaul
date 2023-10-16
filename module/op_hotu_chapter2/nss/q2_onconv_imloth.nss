//:://////////////////////////////////////////////////
//:: q2_onconv_imloth
/*
  Default OnConversation event handler for NPCs.

 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{

    // * If dead, exit directly.
    if (GetIsDead(OBJECT_SELF) == TRUE)
    {
        return;
    }


        // Not a match -- start an ordinary conversation
        if (GetCommandable(OBJECT_SELF))
        {
            ClearActions(CLEAR_NW_C2_DEFAULT4_29);

            if (GetLocalInt(GetModule(), "X2_Q2ABattle2Started") > 0)
                BeginConversation("q2aherald");
            else
                BeginConversation();
        }

}
