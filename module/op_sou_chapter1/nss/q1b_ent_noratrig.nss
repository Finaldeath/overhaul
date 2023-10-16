// q1b_ent_noratrig
//Get Nora to talk to entering objects if they come from her house
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetLocalInt(oPC, "X1_NoraMustTalkTo") == 1)
    {
        object oNora = GetObjectByTag("q1bnora");
        SetLocalInt(oPC, "X1_NoraMustTalkTo", 0);
        if (GetTag(GetArea(oNora)) == GetTag(GetArea(OBJECT_SELF)))
        {
            if (IsInConversation(oNora) == FALSE)
            {
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oNora, ActionStartConversation(oPC));
            }
        }
    }

}
