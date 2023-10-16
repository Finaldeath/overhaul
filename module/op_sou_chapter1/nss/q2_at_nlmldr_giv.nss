//::///////////////////////////////////////////////
//:: FileName q2_at_nlmldr_giv
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/3/2003 11:59:27 AM
//:://////////////////////////////////////////////

#include "q2_inc_plot"

void main()
{
    object oKey = OBJECT_INVALID;
    oKey = GetObjectByTag("Q2_KEY_PUZZLE_ROOM");
    if(oKey != OBJECT_INVALID)
        DestroyObject(oKey);
    CreateItemOnObject("elvenhalloftrial", GetPCSpeaker());
    SetPlot("Q2_JOURNAL_ELVEN_TEST", 1, GetPCSpeaker());
    SetLocalInt(GetModule(),"X1_NILMALDORDONE",10);

}
