#include "q5_inc_plot"

void main()
{
    object oMaster = OBJECT_SELF;
    //GetPCs rod of ruler
    object oRod = GetLocalObject(oMaster, "oRod");
    DestroyObject(oRod);
    object oNewRod = CreateItemOnObject("q5rodofruler", oMaster);
    SetDroppableFlag(oNewRod, TRUE);
    //SetPlot("jt_q5masterjump", 100, GetFirstPC());
    SetPlot("jt_q5blocked", 20, GetFirstPC());
    object oWP = GetWaypointByTag("Q5_WP_MASTER_JUMPER");
    ActionForceMoveToObject(oWP, TRUE);
    SetCommandable(FALSE, oMaster);
    DelayCommand(30.0, SetCommandable(TRUE, oMaster));
    string sBaseTag = "Q5_WP_JUMPER";
    int i = 1;
    object oJumperWP;
    string sTag;
    for (i = 1; i <= 7; i++)
    {
        sTag = sBaseTag + IntToString(i);
        oJumperWP = GetWaypointByTag(sTag);
        CreateObject(OBJECT_TYPE_CREATURE, "q5_kobold_jumper", GetLocation(oJumperWP));
    }
}

