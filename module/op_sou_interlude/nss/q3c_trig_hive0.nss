// first hive trigger - player hears a voice in his head

#include "nw_i0_plot"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;

    object oQueen = GetNearestObjectByTag("X0_FORM_QUEEN");
    if(oQueen == OBJECT_INVALID)
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, SpeakOneLinerConversation("q3c_hivequeen0", oPC));

}
