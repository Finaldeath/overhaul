#include "x2_inc_cutscene"
#include "x2_inc_restsys"
#include "x2c2_inc_plot"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT") != TRUE)
    {
        SetLocalString(OBJECT_SELF, "X2_WM_ENCOUNTERTABLE", "CultTemple1");
        //SetLocalInt(OBJECT_SELF, "X2_WM_AREA_USEDOORS", 1);
        SetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT",TRUE);
    }
    object oPC = GetEnteringObject();
    if(GetTag(oPC) == "q3c_Lavoera") // the deva enters - should init dialog with the pc
    {
        object oMaster = GetMaster(oPC);
        DelayCommand(3.0, AssignCommand(oPC, ActionStartConversation(oMaster)));
    }
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CUTSCENE_STUFF_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_CUTSCENE_STUFF_ONCE", 1);

    SetLocalInt(GetModule(), "q3_NoCutscene", 1);
    if(GetPlot("q3_dracolich") < 20)
        SetPlot("q3_dracolich", 45);
    CutSetActiveCutscene(31, CUT_DELAY_TYPE_CONSTANT, FALSE);
    object oWP = GetWaypointByTag("q3a_wp_associates");
    CutJumpAssociateToLocation(0.0, oPC, GetLocation(oWP));
}
