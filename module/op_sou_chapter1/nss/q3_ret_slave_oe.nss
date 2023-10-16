// update plot when slave returns

#include "q3_inc_plot"

void main()
{
    object oEnter = GetEnteringObject();
    //Check to see if Glendir is Dead - if so - update the journal
    if (GetLocalInt(GetModule(), "q3_Glendir_OnHisOwn") == 1)
    {
        if (GetIsPC(oEnter) == TRUE)
        {
            SetPlot("Q3_JOURNAL_GLENDIR", 75, oEnter);
        }
    }
    if(GetTag(oEnter) != "Q3_GLENDIL")
        return;
    AssignCommand(oEnter, ClearAllActions());
    object oPC = GetLocalObject(oEnter, "Q3_FOLLOW");
    SetLocalObject(oEnter, "Q3_FOLLOW", OBJECT_INVALID);
    SetPlot("Q3_JOURNAL_GLENDIR", 100, oPC);
    AssignCommand(oEnter, ActionStartConversation(oPC));
    SetLocalInt(oEnter, "Q3_GOT_TO_EXIT", 1);
}
