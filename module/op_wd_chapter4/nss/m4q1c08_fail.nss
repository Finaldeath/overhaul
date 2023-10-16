// * Gedry warns player when player fails to
// * open the door
#include "nw_i0_generic"
#include "M4PLOTINCLUDE"
void main()
{
   // AssignCommand(GetEnteringObject(),SpeakString("Failed"));
    SetLocalInt(GetEnteringObject(),"NW_L_TRIEDTO_OPENDOOR", 10);
    object oPC = GetEnteringObject();
    // * set him up to initiate again
    //AssignCommand(GetNearestObjectByTag("M4Q01C08PAST"),SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION, TRUE));
    AssignCommand(GetNearestObjectByTag("M4Q01C08PAST"), ActionStartConversation(oPC));
}
