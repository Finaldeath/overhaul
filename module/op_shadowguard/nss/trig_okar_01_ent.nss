#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        SceneSpeak(oPC, "[Meeting with Overlord Vhorkas is going to go here.  Not implemented yet, just go straight to speaking with Okaris.]");

    //    DoCutsceneConversation(oPC, "sc_st_0_im_ok");
    }
}
